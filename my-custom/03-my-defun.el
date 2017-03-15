;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;                             Start custom functions
;;
;; Friday, 15. May 2015
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun print-ascii-table ()
  "Print the ascii table - based on a defun by Alex Schroeder <asc@bsiag.com>"
  (interactive)
  (switch-to-buffer "*ASCII*")
  (erase-buffer)
  (insert (format "ASCII characters up to number %d.\n" 254))
  (let ((i 0))
    (while (< i 254)
      (setq i (+ i 1))
      (insert (format "%4d %c\n" i i))))
  (beginning-of-buffer))


(defun reverse-words (start end)
  (interactive "r")
  (let ((words (reverse (split-string (buffer-substring start end)))))
    (delete-region start end)
    (dolist (word words)
      (insert word " "))
    (backward-char 1)
    (delete-char 1)))


(defun reverse-region-by-line (beg end)
  (interactive "r")
  (save-excursion
    (goto-char beg)
    (while (and (< (point) end) (re-search-forward "\\=.*$" end t))
      (replace-match (apply #'string
                            (nreverse (string-to-list (match-string 0)))))
      (forward-line))))

(defun randomize-region (start end)
  "Randomly re-order the lines in the region."
  (interactive "r")
  (save-excursion
    (save-restriction
      ;; narrow to the region
      (narrow-to-region start end)
      (goto-char (point-min))
      (let* ((nlines (line-number-at-pos end))
             (lines (make-vector nlines nil)))
        ;;
        (while (not (eobp))
          (setf (aref lines (decf nlines)) ; if it's random backwards
                is fine
                (delete-and-extract-region (point)
                                           (progn (forward-visible-
                                                   line 1)
                                                  (point)))))
        ;;
        (let ((rlines (shuffle-vector lines)))
          (dotimes (linenum (length rlines))
            (insert (aref rlines linenum))))))))



;;Convert DOS cr-lf to UNIX newline
(defun dos2unix () (interactive) (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;;Convert UNIX newline to DOS cr-lf
(defun unix2dos () (interactive) (goto-char (point-min))
  (while (search-forward "\n" nil t) (replace-match "\r\n")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Inizio move text - M+Up/Down muove una riga o una regione in stile eclipse
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg)
          ;; Account for changes to transpose-lines in Emacs 24.3
          (when (and (eval-when-compile
                       (not (version-list-<
                             (version-to-list emacs-version)
                             '(24 3 50 0))))
                     (< arg 0))
            (forward-line -1)))
        (forward-line -1))
      (move-to-column column t)))))

;;;###autoload
(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

;;;###autoload
(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key [M-down] 'move-text-down)
(global-set-key [M-up] 'move-text-up)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Fine move text
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Cerca il testo selezionato nella directory corrente
(defun grep-selected (start end)
  (interactive "r")
  (grep (concat "grep -nHR -e "
                (buffer-substring start end)
                " * .*")))

(global-set-key "\C-\M-g" 'grep-selected)

;; Cerca il testo selezionato
(defun find-selected (start end)
  (interactive "r")
  (find-dired (concat "find . -iname "
                (buffer-substring start end)
                " -ls ")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start Insert date
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun insert-date (prefix)
  "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name.
  Usage:
    * ‘C-c d’: 13.04.2004
    * ‘C-u C-c d’: 2004-04-13
    * ‘C-u C-u C-c d’: Martedi, 13. April 2004 "
  (interactive "P")
  (let ((format (cond
				 ((not prefix) "%d.%m.%Y")
				 ((equal prefix '(4)) "%Y-%m-%d")
				 ((equal prefix '(16)) "%A, %d. %B %Y")))
		(system-time-locale "it_IT"))
	(insert (format-time-string format))))

(global-set-key (kbd "C-c d") 'insert-date)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End insert date
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun mouse-search-forward (begin end)
  (interactive (list (point) (mark)))
  (let ((text (filter-buffer-substring begin end nil t)))
    (goto-char (max begin end))
    (let ((found-pos (search-forward text nil t)))
      (if (not found-pos)
          (progn
            (goto-char begin)
            (error "Fine file!!!"))
          (progn
            (goto-char found-pos)
            (set-mark (- found-pos (length text))))))))

(defun mouse-search-backward (begin end)
  (interactive (list (point) (mark)))
  (let ((text (filter-buffer-substring begin end nil t)))
    (goto-char (min begin end))
    (let ((found-pos (search-backward text nil t)))
      (if (not found-pos)
          (progn
            (goto-char begin)
            (error "Inizio file!!!"))
          (progn
            (goto-char found-pos )
            (set-mark (+ found-pos (length text))))))))

(defun mouse-search (begin end)
  (interactive (list (point) (mark)))
  (let ((text (filter-buffer-substring begin end nil t)))
    (goto-char (max begin end))
    (let ((found-pos (search-forward text nil t)))
      (if (not found-pos)
          (progn
            (goto-char begin)
            (mouse-search-backward begin end))
          (progn
            (goto-char found-pos)
            (set-mark (- found-pos (length text))))))))

(defun my-search(begin end)
  (interactive (list (point) (mark)))
  
  (let ((text (filter-buffer-substring begin end )))
	
  	(let ((found-pos (search-forward text nil t))
  		  (num-matches (how-many text (point-min) (point-max))))
  	  (if (not found-pos)
  		  (progn
  			(message "Raggiunta la fine del testo, ci sono %d occorrenze !!!" num-matches)
  			(goto-char 1)
  			(setq found-pos (search-forward text nil t))
  			(set-mark (- found-pos (length text))))
  		  (progn
  			(goto-char found-pos)
  			(set-mark (- found-pos (length text))))))))

(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
	(let ((end (copy-marker end)))
	  (while
		  (progn
			(goto-char start)
			(re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
		(replace-match "\\1\n\\2")))))


(defun uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))

;; Rimuove tutte le occorrenze multiple di spazi all' interno di una selezione
(defun just-one-space-in-region (beg end)
  "replace all whitespace in the region with single spaces"
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (re-search-forward "\\s-+" nil t)
        (replace-match " ")))))

;;
;; Funzione che simula il % matching parenthesis di VI, associato ad META+%
;;
(defun my-match-paren(arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
		((looking-at "\\s\)") (forward-char 1) (backward-list 1))
		(t (self-insert-command (or arg 1)))))

;;
;;  Inizio Fullscreen mode
;;
(defvar my-fullscreen-p t "Check if fullscreen is on or off")
(defun my-non-fullscreen ()
  (interactive)
  (if (fboundp 'w32-send-sys-command)
	  ;; WM_SYSCOMMAND restore #xf120
	  (w32-send-sys-command 61728)
	(progn (set-frame-parameter nil 'width 82)
		   (set-frame-parameter nil 'fullscreen 'fullheight))))

(defun my-fullscreen ()
  (interactive)
  (if (fboundp 'w32-send-sys-command)
	  ;; WM_SYSCOMMAND maximaze #xf030
	  (w32-send-sys-command 61488)
	(set-frame-parameter nil 'fullscreen 'fullboth)))


(defun my-toggle-fullscreen ()
  (interactive)
  (setq my-fullscreen-p (not my-fullscreen-p))
  (if my-fullscreen-p
	  (my-non-fullscreen)
	(my-fullscreen)))
;;
;;  Fine Fullscreen mode
;;

;; Marcello - definisce una directory per i file di backup creati da emacs
(defun make-backup-file-name (filename)
  (concat "~/.emacs.d/backup/" (file-name-nondirectory filename) ".bak")
  )

;; Scroll other window shortcut
(defun scroll-other-window-up ()
  "Scroll the other window one line up."
  (interactive)
  (scroll-other-window -1)
  )

(defun scroll-other-window-down ()
  "Scroll the other window one line down."
  (interactive)
  (scroll-other-window 1)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             End custom functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
