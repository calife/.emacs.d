;;;; Friday, 15. May 2015
;; https://github.com/howardabrams/dot-files/blob/master/emacs-ruby.org

;; (unless (package-installed-p 'inf-ruby)
;;   (package-install 'inf-ruby))

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

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; rvm.el
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'rvm)
(rvm-use-default) ;; use rvm's default ruby for the current Emacs session
;; (rvm-use (rvm--ruby-default) rvm--gemset-default)
;; (global-set-key (kbd "C-c r a") 'rvm-activate-corresponding-ruby)


;; ;; Syntax Checking
(require 'flymake-ruby)

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

; 2.4.0
(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(defadvice inf-ruby-console-auto (before activate-rvm-for-robe activate)
  (rvm-activate-corresponding-ruby))

; 2.5.0
;; (autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)

(defun inf-ruby-keys ()
  "Set local key defs for inf-ruby in ruby-mode"
  (define-key ruby-mode-map (kbd "<f2>") 'run-ruby)
  ;; (define-key ruby-mode-map (kbd "<f2>") 'inf-ruby-console-auto) ; 2.5.0 inf-ruby
  (define-key ruby-mode-map (kbd "<f5>") 'ruby-send-region)
  (define-key ruby-mode-map (kbd "<f8>") 'ruby-load-file))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; autocomplete in inf-ruby mode
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(eval-after-load 'auto-complete
  '(add-to-list 'ac-modes 'inf-ruby-mode)  )

;; ;Optionally bind auto-complete to TAB in inf-ruby buffers:
(eval-after-load 'inf-ruby '
  '(define-key inf-ruby-mode-map (kbd "TAB") 'auto-complete))

(add-hook 'ruby-mode-hook
		  '(lambda ()
			 (message "Start ruby hooks")
			 (inf-ruby-minor-mode)
			 (inf-ruby-keys)
			 (rvm-activate-corresponding-ruby)
			 (ruby-tools-mode)
			 (rainbow-mode)
			 (flymake-ruby-load)
			 (ac-inf-ruby-enable)
			 (robe-mode)
			 (package-initialize)
			 (message "Leave ruby hooks")
			 ))


;;
;; Robe key bindings
;; M-.  =>  robe jump
;; C-c C-d => robe doc
;;
