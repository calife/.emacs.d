;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;                             Start custom functions
;;
;; Friday, 15. May 2015
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "Loading 03-my-defun")

(defun calife-help ()
   "Print help for calife-* functions <califerno@gmail.com>"
   (interactive)
   (switch-to-buffer "*CALIFE HELP*")
   (erase-buffer)
   (insert (format "%s\n" "================================================== CALIFE CUSTOM FUNCTIONS =================================================="))
   (insert (format "%50s %-10s %-60s\n" "FUNCTION" " KEY" "DESCRIPTION"))
   (insert (format "%s\n" "============================================================================================================================="))
   (insert (format "%50s  %-10s %-60s\n" "calife-help" "" "Print help for calife-* functions <califerno@gmail.com>"))
   (insert (format "%50s  %-10s %-60s\n" "calife-grep-selected" "C-S-f" "Grep selected text into current directory"))
   (insert (format "%50s  %-10s %-60s\n" "calife-comment-or-uncomment-eclipse" "C-S-c" ""))
   (insert (format "%50s  %-10s %-60s\n" "calife-region-info" "" "Sample code to show region begin/end positions."))
   (insert (format "%50s  %-10s %-60s\n" "calife-is-region-active" "" "Print whether region is active."))
   (insert (format "%50s  %-10s %-60s\n" "calife-upcase-region-or-word" "C-x C-y" "upcase current word or region."))
   (insert (format "%50s  %-10s %-60s\n" "calife-downcase-region-or-word" "C-x C-x"  "downcase current word or region."))
   (insert (format "%50s  %-10s %-60s\n" "calife-camel-region-or-word" "C-x C-z" "Camel current word or region(Still in development)."))
   (insert (format "%50s  %-10s %-60s\n" "calife-delete-blank-lines" "C-S-Canc" "Delete multiple blank lines on selection."))
   (insert (format "%s\n" "============================================================================================================================="))
   (insert (format "%s\n" ""))
   (insert (format "%s\n" ""))
   (insert (format "%s\n" "================================================== CALIFE CUSTOM KEYS =================================================="))
   (insert (format "%50s %-10s\n" "FUNCTION" " KEY" ))
   (insert (format "%s\n" "============================================================================================================================="))
   (insert (format "%50s  %-10s \n" "C-8" "{" ))
   (insert (format "%50s  %-10s \n" "C-9" "}" ))
   (insert (format "%50s  %-10s \n" "C-ì" "~" ))
   (insert (format "%50s  %-10s \n" "C-'" "`" ))
   (insert (format "%s\n" "============================================================================================================================="))
   (end-of-buffer))

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

;; Cerca il testo selezionato nella directory corrente
;; (defun
;; 	calife-grep-selected (start end)
;;   "Grep selected text into current directory"
;;   (interactive "r")
;;   (message "calife-grep-selected")
;;   (message (buffer-substring start end))
;;   (grep (concat "grep --color=always --exclude='./projectile.cache' --exclude-dir='./.git' -nHR -e '"
;;                 (buffer-substring start end)
;; 				"' . ")))

;; TODO remove because defined in grep.el
;; (eval-after-load 'grep
;;   '(when (boundp 'grep-find-ignored-files)
;;      (add-to-list 'grep-find-ignored-files "*projectile.cache")))
;; (eval-after-load 'grep
;;   '(when (boundp 'grep-find-ignored-directories)
;;      (add-to-list 'grep-find-ignored-directories "*.git")))

(defun
	calife-grep-selected (start end)
  "RGrep selected text into current directory"
  (interactive "r")
  (message "calife-grep-selected")
  (message (buffer-substring start end))
  (lgrep  (buffer-substring start end)))





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
		(system-time-locale "en_US"))
		(insert (format-time-string format))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End insert date
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Start search
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun my-search-forward(begin end)
  (interactive (list (point) (mark)))
  
  (let ((text (filter-buffer-substring begin end )))
	(message "search string %s" text)
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

(defun my-search-backward(begin end)
  (interactive (list (point) (mark)))
  
  (let ((text (filter-buffer-substring begin end )))
	(message "search string %s" text)
  	(let ((found-pos (search-backward text nil t))
  		  (num-matches (how-many text (point-min) (point-max)))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End search
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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


;;;;;;;;;;;;;;;;;;;;
;; Start Linum setup
;;;;;;;;;;;;;;;;;;;;

(defvar *linum-mdown-line* nil)

(defun line-at-click ()
  (save-excursion
	(let ((click-y (cdr (cdr (mouse-position))))
		  (line-move-visual-store line-move-visual))
	  (setq line-move-visual t)
	  (goto-char (window-start))
	  (next-line (1- click-y))
	  (setq line-move-visual line-move-visual-store)
	  ;; If you are using tabbar substitute the next line with
	  ;; (line-number-at-pos))))
	  (1+ (line-number-at-pos)))))

(defun md-select-linum ()
  (interactive)
  (goto-line (line-at-click))
  (set-mark (point))
  (setq *linum-mdown-line*
		(line-number-at-pos)))

(defun mu-select-linum ()
  (interactive)
  (when *linum-mdown-line*
	(let (mu-line)
	  ;; (goto-line (line-at-click))
	  (setq mu-line (line-at-click))
	  (goto-line (max *linum-mdown-line* mu-line))
	  (set-mark (line-end-position))
	  (goto-line (min *linum-mdown-line* mu-line))
	  (setq *linum-mdown*
			nil))))

;;;;;;;;;;;;;;;;;;;;
;; End Linum setup
;;;;;;;;;;;;;;;;;;;;


;; https://www.emacswiki.org/emacs/CommentingCode
(defun calife-comment-or-uncomment-eclipse ()
      (interactive)
      (let ((start (line-beginning-position))
            (end (line-end-position)))
        (when (or (not transient-mark-mode) (region-active-p))
          (setq start (save-excursion
                        (goto-char (region-beginning))
                        (beginning-of-line)
                        (point))
                end (save-excursion
                      (goto-char (region-end))
                      (end-of-line)
                      (point))))
        (comment-or-uncomment-region start end)))


;; http://ergoemacs.org/emacs/emacs_region.html
(defun calife-region-info ()
  "Sample code to show region begin/end positions."
  (interactive)
  (message "begin at %s end at %s"
           (region-beginning)
           (region-end)))

(defun calife-is-region-active ()
  "Print whether region is active."
  (interactive)
  (if (use-region-p)
      (message "region active")
    (message "region not active")))

(defun calife-upcase-region-or-word ()
  "upcase current word or region."
(interactive)
(let (pos1 pos2 bds)
  (if (use-region-p)
     (setq pos1 (region-beginning) pos2 (region-end))
    (progn
      (setq bds (bounds-of-thing-at-point 'word))
      (setq pos1 (car bds) pos2 (cdr bds))))

  ;; now, pos1 and pos2 are the starting and ending positions of the
  ;; current word, or current text selection if exist.
  (upcase-region pos1 pos2)
  ))

(defun calife-downcase-region-or-word ()
  "downcase current word or region."
(interactive)
(let (pos1 pos2 bds)
  (if (use-region-p)
     (setq pos1 (region-beginning) pos2 (region-end))
    (progn
      (setq bds (bounds-of-thing-at-point 'word))
      (setq pos1 (car bds) pos2 (cdr bds))))

  ;; now, pos1 and pos2 are the starting and ending positions of the
  ;; current word, or current text selection if exist.
  (downcase-region pos1 pos2)
  ))


(defun calife-camel-region-or-line ()
  "Camel current word or region."
(interactive)
(let (pos1 pos2 bds)
  (if (use-region-p)
     (setq pos1 (region-beginning) pos2 (region-end))
    (progn
      (setq bds (bounds-of-thing-at-point 'word))
      (setq pos1 (car bds) pos2 (cdr bds))))

  ;; now, pos1 and pos2 are the starting and ending positions of the
  ;; current word, or current text selection if exist.
  (capitalize-region pos1 pos2)
  ))


(defun calife-delete-blank-lines ()
  "Delete multiple empty lines in selection."
      (interactive)
      (let ((start (line-beginning-position))
            (end (line-end-position)))
        (when (or (not transient-mark-mode) (region-active-p))
          (setq start (save-excursion
                        (goto-char (region-beginning))
                        (beginning-of-line)
                        (point))
                end (save-excursion
                      (goto-char (region-end))
                      (end-of-line)
                      (point))))
	  (flush-lines "^[[:space:]]*$" start end)))
	


;; (defun shell-command-on-region-or-line ()
;;   "Run selected text in a terminal or use the current line."
;;   (interactive)
;;   (shell-command
;;    (concat

;;     ;; pick one!
;;     "gnome-terminal -e "
;;     ; "roxterm --tab -e "
;;     ; "terminator -x "

;;     (if (use-region-p)
;;         ;; current selection
;;         (buffer-substring (region-beginning) (region-end))
;;         ;; current line
;;         (thing-at-point 'line t)))))

;;
;; Openshift custom functions
;;

(defun calife-oc-login ()
  "Openshift login using CDP credential."
  (interactive)
  (shell-command
   (concat "~/bin/" "oc-login")))

(defun calife-oc-get-projects()
  "Openshift get all project."
  (interactive)
  (shell-command
   (concat "~/bin/" "oc-get-projects")))

(defun calife-oc-set-project ()
  "Openshift set openshift project."
  (interactive)
  (shell-command
   (concat "~/bin/" "oc-set-project " (read-string "Enter project name:"))))

(defun calife-oc-current-project()
  "Openshift get current project."
  (interactive)
  (shell-command
   (concat "~/bin/" "oc-current-project")))

(defun calife-oc-get-pods()
  "Openshift get CDP pods for current project."
  (interactive)
  (shell-command
   (concat "~/bin/" "oc-get-pods")))

(defun calife-oc-view-log()
  "Openshift follow CDP log for a given pod."
  (interactive)
  (shell-command
   (concat "~/bin/" "oc-view-log" " " (read-string "Enter pod name:"))))

(defun calife-oc-download-log()
  "Openshift get CDP log for a given pod."
  (interactive)
  (shell-command
   (concat "~/bin/" "oc-download-log" " " (read-string "Enter pod name:"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                             End custom functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "Loaded 03-my-defun")
