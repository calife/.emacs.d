;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start ruby
;;
;; Friday, 15. May 2015
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Syntax Checking
(require 'flymake-ruby)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rvm.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session
(global-set-key (kbd "C-c r a") 'rvm-activate-corresponding-ruby)

(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; autocomplete in inf-ruby mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(eval-after-load 'auto-complete
  '(add-to-list 'ac-modes 'inf-ruby-mode)  )

;Optionally bind auto-complete to TAB in inf-ruby buffers:
(eval-after-load 'inf-ruby '
  '(define-key inf-ruby-mode-map (kbd "TAB") 'auto-complete))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Smartparens Setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'smartparens-config)
(require 'smartparens-ruby)
(smartparens-global-mode)
(show-smartparens-global-mode t)
(sp-with-modes '(rhtml-mode)
  (sp-local-pair "<" ">")
  (sp-local-pair "<%" "%>"))

;; Miscellaneous, C-' , C-" , # , C-:
(require 'ruby-tools)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ruby Block Setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'ruby-block)
;; (ruby-block-mode t)
 
;; do overlay
;; (setq ruby-block-highlight-toggle 'overlay)
;; ;; display to minibuffer
;; (setq ruby-block-highlight-toggle 'minibuffer)
;; ;; display to minibuffer and do overlay
;; (setq ruby-block-highlight-toggle t)

(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)

(defun inf-ruby-keys ()
  "Set local key defs for inf-ruby in ruby-mode"
  (define-key ruby-mode-map (kbd "<f2>") 'run-ruby)
  (define-key ruby-mode-map (kbd "<f5>") 'ruby-send-region)
  (define-key ruby-mode-map (kbd "<f8>") 'ruby-load-file))


;; (add-hook 'ruby-mode-hook
;; 		  '(lambda ()
;; 			 (inf-ruby-keys)
;; 			 ))
;; (add-hook 'ruby-mode-hook (lambda () (rainbow-mode 1)))
;; (add-hook 'ruby-mode-hook 'robe-mode)
;; (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
;; (add-hook 'ruby-mode-hook 'turn-on-font-lock)
;; (add-hook 'ruby-mode-hook 'flymake-ruby-load)
;; (add-hook 'ruby-mode-hook 'ruby-tools-mode)
;; (add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)

(defun my/ruby-hooks ()
  (message "Start ruby hooks")
  (rainbow-mode 1)
  (inf-ruby-minor-mode)
  (inf-ruby-keys)
  (turn-on-font-lock)
  (flymake-ruby-load)
  (ruby-tools-mode)
  (ac-inf-ruby-enable)
  (message "End ruby hooks"))

(add-hook 'ruby-mode-hook 'my/ruby-hooks)

(setq auto-mode-alist
	  (append '(("\\.rb\\'"    . ruby-mode)
				("\\.rake\\'" . ruby-mode)
				("\\.ru\\'" . ruby-mode)
				("\\.rabl\\'" . ruby-mode)
				("Gemfile\\'" . ruby-mode)
				("Capfile\\'" . ruby-mode)
				("Vagrantfile\\'" . ruby-mode)
				("Guardfile\\'" . ruby-mode)
				(".metrics\\'" . ruby-mode)
				(".irbrc\\'" . ruby-mode))
				auto-mode-alist ))
