
;;
;; Definisce le combinazioni per ottenere caratteri non mappati sulla tastiera
;;
;; Friday, 15. May 2015
;;

;; Prevent accidentally killing emacs.
(global-set-key [(control x) (control c)]
		'(lambda ()
		   (interactive)
		   (if (y-or-n-p-with-timeout "Quit Emacs, are you sure ? " 4 nil)
		       (save-buffers-kill-emacs))))

(global-set-key (kbd "<M-f4>")
				'(lambda ()
				   (interactive)
				   (if (y-or-n-p-with-timeout "Quit Emacs, are you sure ? " 4 nil)
					   (save-buffers-kill-emacs))))

(global-set-key (kbd "M-<up>") 'calife-move-line-up)
(global-set-key (kbd "M-<down>") 'calife-move-line-down)

;; (global-set-key "\C-\M-g" 'calife-grep-selected)
(global-set-key (kbd "C-S-f") 'calife-grep-selected)

(define-key projectile-mode-map (kbd "C-S-n") 'projectile-find-file)
(define-key projectile-mode-map (kbd "C-S-f") 'projectile-grep)


(global-set-key (kbd "C-c d") 'insert-date)

(global-set-key (kbd "\C-x\C-b") 'ibuffer)

(global-set-key (kbd "C-8") "{" )
(global-set-key (kbd "C-9") "}" )
(global-set-key (kbd "C-ì") "~" )
(global-set-key (kbd "C-'") "`" )
(global-set-key [f11] 'my-toggle-fullscreen)
(global-set-key (kbd "\C-x\C-r") 'find-name-dired)
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-S-c") 'comment-or-uncomment-region)
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)
(global-set-key (kbd "<M-S-return>" ) 'my-toggle-fullscreen)
(global-set-key (kbd "%") 'my-match-paren) ; matching delle parentesi in stile VI
(global-set-key (kbd "<C-S-delete>") 'just-one-space-in-region) ; remove multiple whitespaces in buffer 
;; (global-set-key (kbd "C-S-f") 'indent-region)
(global-set-key (kbd "\M-%") 'query-replace)
(global-set-key [up] "\C-p")
(global-set-key [down] "\C-n")
(global-set-key [left] "\C-b")
(global-set-key [right] "\C-f")
(global-set-key [home] "\C-a")
(global-set-key [end] "\C-e")
(global-set-key [prior] "\M-v")
(global-set-key [next] "\C-v")
(global-set-key [C-up] "\M-\C-b")
(global-set-key [C-down] "\M-\C-f")
(global-set-key [C-left] "\M-b")
(global-set-key [C-right] "\M-f")
(global-set-key [C-home] "\M-<")
(global-set-key [C-end] "\M->")
(global-set-key [C-prior] "\M-<")
(global-set-key [C-next] "\M->")
(global-set-key (kbd "C-z") 'undo)
(global-set-key "\M-g" 'goto-line)

;; (global-set-key (kbd "<f2>") 'inf-ruby)

;; Frame sesize
(global-set-key (kbd "S-<up>") (lambda () (interactive) (shrink-window 5)))
(global-set-key (kbd "S-<down>") (lambda () (interactive) (enlarge-window 5)))
(global-set-key (kbd "S-<left>") (lambda () (interactive) (shrink-window-horizontally 5)))
(global-set-key (kbd "S-<right>") (lambda () (interactive) (enlarge-window-horizontally 5)))

;; Multi window layout
(global-set-key (kbd "<M-C-prior>" ) 'scroll-other-window-up)
(global-set-key (kbd "<M-C-next>" ) 'scroll-other-window-down)

; Cycle throw windows
(global-set-key [C-tab] (lambda () (interactive) (other-window +1)))
(global-set-key [S-iso-lefttab] (lambda () (interactive) (other-window -1)))

;; Shells
;; gnu/linux
;; (global-set-key [f12]
;; 				'(lambda ()
;; 				   (interactive)
;; 				   (ansi-term "/bin/bash")
;; 				   ))

;; win32 eshell
;; (global-set-key [f12]
;; 				'(lambda ()
;; 				   (interactive)
				   
;; 				   ;; (ansi-term "/bin/bash")
				   
;; 				   (setq binary-process-input t) 
;; 				   (setq w32-quote-process-args ?\")
;; 				   (setq comint-scroll-show-maximum-output 'this)
;; 				   (make-variable-buffer-local 'comint-completion-addsuffix)
;; 				   (setq comint-completion-addsuffix t)
;; 				   (setq comint-eol-on-send t)
;; 				   (setq w32-quote-process-args ?\")
;; 				   (setenv "SHELL" "ESHELL")
;; 				   (eshell)
;; 				   ))

;; win32 cygwin bash
;; (defun run-bash ()
;;   (interactive)
;;   (let ((shell-file-name "/bin/bash.exe")
;; 		(add-hook 'comint-mode-hook 'ansi-color-for-comint-mode-on)
;; 		)
;; 	(shell "*bash*"))
;;   )

 ;; (add-hook 'term-mode-hook
 ;; 		  (function
 ;; 		   (lambda ()
 ;; 			 (setenv "PS1" ">>")
 ;; 			 ;; (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")
 ;; 			 ;; (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")
 ;; 			 (make-local-variable 'mouse-yank-at-point)
 ;; 			 (make-local-variable 'transient-mark-mode)
 ;; 			 (setq mouse-yank-at-point t)
 ;; 			 (setq transient-mark-mode nil)
 ;; 			 (auto-fill-mode -1)
 ;; 			 (setq tab-width 8 ))))

;; (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; (setq explicit-shell-file-name "c:/cygwin64/bin/bash.exe")
;; (setq shell-file-name "bash")
;; (setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
;; (setenv "SHELL" shell-file-name)
;; (add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)

;; (global-set-key [f12]
;; 				'(lambda ()
;; 				   (interactive)
;; 				   (message "* -------------------------[ Start Loading my Emacs init file ]--")
;; 				   (setenv "TERM" "tty" )
;; 				   (setenv "PS1" ">>>>>>>")
;; 				   (setq multi-term-program "/bin/bash")
;; 				   (ansi-term "c:/cygwin64/bin/bash.exe")
;; 				   (message "* -------------------------[ Leave Loading my Emacs init file ]--")
;; 				   ))

(defun eshell/open (file)
    "Invoke (w32-shell-execute \"Open\" file) and substitute slashes for backslashes"
    (w32-shell-execute "Open"
                       (subst-char-in-string ?\\ ?/ (expand-file-name file)))
    nil)

(define-key global-map [(C down-mouse-1)] nil)
(define-key global-map [(C mouse-1)] 'my-search)

;; shift + click select region, permette di selezionare regions tenendo premuto Shift + mouse1
(define-key global-map (kbd "<S-down-mouse-1>") 'ignore) ; turn off font dialog
(define-key global-map (kbd "<S-mouse-1>") 'mouse-set-point)



(global-set-key (kbd "<left-margin> <down-mouse-1>") 'md-select-linum)
(global-set-key (kbd "<left-margin> <mouse-1>") 'mu-select-linum)
(global-set-key (kbd "<left-margin> <drag-mouse-1>") 'mu-select-linum)

;; (defun ssh (hostname &optional flags)
;;   "Start an SSH session in a shell window."
;;   (interactive "MSSH to host: ")
;;   (let ((buf (concat "*SSH:" hostname "*")))
;; 	(if (and (get-buffer buf) (get-buffer-process buf))
;; 		(switch-to-buffer-other-window buf)
;; 	  (async-shell-command (concat "fakecygpty ssh " flags (when flags " ") hostname) buf))))

;; (defun sshx (hostname)
;;   "Start an SSH session with X11 forwarding in a shell window."
;;   (interactive "MSSH to host (X11): ")
;;   (ssh hostname "-X"))

;; C-x d /cygssh:myuser@servername:/home/myuser/
;; (eval-after-load "tramp"
;;   '(progn
;; 	 (add-to-list 'tramp-methods
;; 				  (mapcar
;; 				   (lambda (x)
;; 					 (cond
;; 					  ((equal x "sshx") "cygssh")
;; 					  ((eq (car x) 'tramp-login-program) (list 'tramp-login-program "fakecygpty ssh"))
;; 					  (t x)))
;; 				   (assoc "sshx" tramp-methods)))
;; 	 (setq tramp-default-method "cygssh")))
