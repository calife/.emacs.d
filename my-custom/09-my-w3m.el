(require 'w3m)

(setq w3m-home-page "www.google.com")

;;change default browser for 'browse-url'  to w3m
(setq browse-url-browser-function 'w3m-goto-url-new-session)

;;change w3m user-agent to android
(setq w3m-user-agent "Mozilla/5.0 (Linux; U; Android 2.3.3; zh-tw; HTC_Pyramid Build/GRI40) AppleWebKit/533.1 (KHTML, like Gecko) Version/4.0 Mobile Safari/533.")

;;quick access hacker news
(defun hn ()
  (interactive)
  (browse-url "http://news.ycombinator.com"))

;;quick access reddit
(defun reddit (reddit)
  "Opens the REDDIT in w3m-new-session"
  (interactive (list
                (read-string "Enter the reddit (default: psycology): " nil nil "psychology" nil)))
  (browse-url (format "http://m.reddit.com/r/%s" reddit))
  )


;; Quick access Rome Traffic
(defun rome-traffic ()
  (interactive)
  (browse-url "http://www.google.it/search?q=traffico+roma&ie=utf-8"))


;;i need this often
(defun wikipedia (search-term)
  "Search for SEARCH-TERM on wikipedia"
  (interactive
   (let ((term (if mark-active
                   (buffer-substring (region-beginning) (region-end))
                 (word-at-point))))
     (list
      (read-string
       (format "Wikipedia (%s):" term) nil nil term)))
   )
  (browse-url
   (concat
    "http://en.m.wikipedia.org/w/index.php?search="
    search-term
    ))
  )

;;when I want to enter the web address all by hand
(defun w3m-open-site (site)
  "Opens site in new w3m session with 'http://' appended"
  (interactive
   (list (read-string "Enter website address(default: w3m-home):" nil nil w3m-home-page nil )))
  (w3m-goto-url-new-session
(concat "http://" site)))

(global-set-key "\C-xm" 'browse-url-at-point)

(setq w3m-use-cookies t)

(setq w3m-coding-system 'utf-8
          w3m-file-coding-system 'utf-8
          w3m-file-name-coding-system 'utf-8
          w3m-input-coding-system 'utf-8
          w3m-output-coding-system 'utf-8
          w3m-terminal-coding-system 'utf-8)

(defun w3m-copy-url-at-point ()
  (interactive)
  (let ((url (w3m-anchor)))
	(if (w3m-url-valid url)
		(kill-new (w3m-anchor))
	  (message "No URL at point!"))))

(add-hook 'w3m-mode-hook
		  (lambda ()
			(local-set-key "\M-W" 'w3m-copy-url-at-point)))

(defun w3m-mode-options ()
  (local-set-key (kbd "<left>") 'backward-char)
  (local-set-key (kbd "<right>") 'forward-char)
  (local-set-key (kbd "<up>") 'previous-line)
  (local-set-key (kbd "<down>") 'next-line))

(add-hook 'w3m-mode-hook 'w3m-mode-options)

;; (let ((map (make-keymap)))
;;   (suppress-keymap map)
;;   (define-key map [backspace] 'w3m-scroll-down-or-previous-url)
;;   (define-key map [delete] 'w3m-scroll-down-or-previous-url)
;;   (define-key map "\C-?" 'w3m-scroll-down-or-previous-url)
;;   (define-key map "\t" 'w3m-next-anchor)
;;   (define-key map [(shift tab)] 'w3m-previous-anchor)
;;   (define-key map [(shift iso-left-tab)] 'w3m-previous-anchor)
;;   (define-key map "\C-m" 'w3m-view-this-url)
;;   (define-key map [(shift return)] 'w3m-view-this-url-new-session)
;;   (define-key map [(shift kp-enter)] 'w3m-view-this-url-new-session)
;;   (define-key map [(button2)] 'w3m-mouse-view-this-url)
;;   (define-key map [(shift button2)] 'w3m-mouse-view-this-url-new-session)
;;   (define-key map " " 'scroll-up)
;;   (define-key map "a" 'w3m-bookmark-add-current-url)
;;   (define-key map "\M-a" 'w3m-bookmark-add-this-url)
;;   (define-key map "+" 'w3m-antenna-add-current-url)
;;   (define-key map "A" 'w3m-antenna)
;;   (define-key map "c" 'w3m-print-this-url)
;;   (define-key map "C" 'w3m-print-current-url)
;;   (define-key map "d" 'w3m-download)
;;   (define-key map "D" 'w3m-download-this-url)
;;   ;; (define-key map "D" 'w3m-download-with-wget)
;;   ;; (define-key map "D" 'w3m-download-with-curl)
;;   (define-key map "g" 'w3m-goto-url)
;;   (define-key map "G" 'w3m-goto-url-new-session)
;;   (define-key map "h" 'describe-mode)
;;   (define-key map "H" 'w3m-gohome)
;;   (define-key map "I" 'w3m-toggle-inline-images)
;;   (define-key map "\M-i" 'w3m-save-image)
;;   (define-key map "M" 'w3m-view-url-with-external-browser)
;;   (define-key map "n" 'w3m-view-next-page)
;;   (define-key map "N" 'w3m-namazu)
;;   (define-key map "o" 'w3m-history)
;;   (define-key map "O" 'w3m-db-history)
;;   (define-key map "p" 'w3m-view-previous-page)
;;   (define-key map "q" 'w3m-close-window)
;;   (define-key map "Q" 'w3m-quit)
;;   (define-key map "R" 'w3m-reload-this-page)
;;   (define-key map "s" 'w3m-search)
;;   (define-key map "S" (lambda ()
;; 						(interactive)
;; 						(let ((current-prefix-arg t))
;; 						  (call-interactively 'w3m-search))))
;;   (define-key map "u" 'w3m-view-parent-page)
;;   (define-key map "v" 'w3m-bookmark-view)
;;   (define-key map "W" 'w3m-weather)
;;   (define-key map "=" 'w3m-view-header)
;;   (define-key map "\\" 'w3m-view-source)
;;   (define-key map "?" 'describe-mode)
;;   (define-key map ">" 'scroll-left)
;;   (define-key map "<" 'scroll-right)
;;   (define-key map "." 'beginning-of-buffer)
;;   (define-key map "^" 'w3m-view-parent-page)
;;   (define-key map "]" 'w3m-next-form)
;;   (define-key map "[" 'w3m-previous-form)
;;   (define-key map "}" 'w3m-next-image)
;;   (define-key map "{" 'w3m-previous-image)
;;   (define-key map "\C-c\C-c" 'w3m-submit-form)
;;   (setq dka-w3m-map map))

;; (add-hook 'w3m-mode-hook '(lambda () (use-local-map dka-w3m-map)))
