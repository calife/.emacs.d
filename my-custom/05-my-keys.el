
;;
;; Definisce le combinazioni per ottenere caratteri non mappati sulla tastiera
;;
;; Friday, 15. May 2015
;;

(message "Loading 05-my-keys.el")

;; Prevent accidentally killing emacs.
(global-set-key [(control x) (control c)]
		'(lambda ()
		   (interactive)
		   (if (y-or-n-p-with-timeout "Quit Emacs, are you sure ? " 4 nil)
		       (save-buffers-kill-emacs))))

(global-set-key (kbd "C-S-f") 'calife-grep-selected)

(global-set-key (kbd "C-c d") 'insert-date)

(global-set-key (kbd "\C-x\C-b") 'ibuffer)

(global-set-key (kbd "C-8") "{" )
(global-set-key (kbd "C-9") "}" )
(global-set-key (kbd "C-ì") "~" )
(global-set-key (kbd "C-'") "`" )
(global-set-key [f11] 'my-toggle-fullscreen)

(global-set-key (kbd "C-x C-x") 'calife-downcase-region-or-word)
(global-set-key (kbd "C-x C-y") 'calife-upcase-region-or-word)
(global-set-key (kbd "C-x C-z") 'calife-camel-region-or-word)

(global-set-key (kbd "C-d") 'kill-whole-line)
(global-set-key (kbd "C-S-c") 'calife-comment-or-uncomment-eclipse)
(global-set-key (kbd "C-c t") 'toggle-truncate-lines)
(global-set-key (kbd "<M-S-return>" ) 'my-toggle-fullscreen)
(global-set-key (kbd "%") 'my-match-paren) ; matching delle parentesi in stile VI
;; (global-set-key (kbd "<C-S-delete>") 'just-one-space-in-region) ; remove multiple whitespaces in buffer
(global-set-key (kbd "<C-S-delete>") 'calife-delete-blank-lines) ; remove multiple empty lines
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

;; Frame sesize
(global-set-key (kbd "S-<up>") (lambda () (interactive) (shrink-window 5)))
(global-set-key (kbd "S-<down>") (lambda () (interactive) (enlarge-window 5)))
(global-set-key (kbd "S-<left>") (lambda () (interactive) (shrink-window-horizontally 5)))
(global-set-key (kbd "S-<right>") (lambda () (interactive) (enlarge-window-horizontally 5)))

;; Multi window layout
;; (global-set-key (kbd "<M-C-prior>" ) 'scroll-other-window-up)
;; (global-set-key (kbd "<M-C-next>" ) 'scroll-other-window-down)
(global-set-key (kbd "<M-f2>") 'split-window-below)
(global-set-key (kbd "<M-f3>") 'split-window-right)
(global-set-key (kbd "<M-f4>") 'kill-buffer-and-window)
(global-set-key (kbd "<M-f5>") 'delete-other-windows)
;; (global-set-key [C-M-next]  'next-buffer)
;; (global-set-key [C-M-prior]  'previous-buffer)

; Cycle throw windows
(global-set-key [C-tab] (lambda () (interactive) (other-window +1)))
(global-set-key [S-iso-lefttab] (lambda () (interactive) (other-window -1)))

; Shells
(global-set-key [f12]
				'(lambda ()
				   (interactive)
				   (ansi-term (getenv "SHELL") "Calife Term ©")
				   ))


(define-key global-map [(C down-mouse-1)] nil)
(define-key global-map [(C mouse-1)] 'my-search-forward)
(define-key global-map [(C-S-mouse-1)] 'my-search-backward) ;; @TODO replace with my-search-backward

;; shift + click select region, permette di selezionare regions tenendo premuto Shift + mouse1
(define-key global-map (kbd "<S-down-mouse-1>") 'ignore) ; turn off font dialog
(define-key global-map (kbd "<S-mouse-1>") 'mouse-set-point)

(global-set-key (kbd "<left-margin> <C-double-mouse-1>") 'md-select-linum)
(global-set-key (kbd "<left-margin> <down-mouse-1>") 'md-select-linum)
(global-set-key (kbd "<left-margin> <mouse-1>") 'mu-select-linum)
(global-set-key (kbd "<left-margin> <drag-mouse-1>") 'mu-select-linum)

;; Execute text in a terminal, no questions! (ctrl-alt-shift-enter to avoid accidents!)
;; (global-set-key (kbd "<C-M-return>") 'term-shell-command-on-region-or-line)

(message "Loaded 05-my-keys.el")
