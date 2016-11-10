;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start ruby
;;
;; Friday, 15. May 2015
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Syntax Checking
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'robe-mode)

;; (require 'company)
;; (add-hook 'ruby-mode-hook 'company-robe)
;; (eval-after-load 'company
;;   '(push 'company-robe company-backends))

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
;; (require 'ac-inf-ruby) ;; when not installed via package.el
(eval-after-load 'auto-complete
  '(add-to-list 'ac-modes 'inf-ruby-mode)  )
  ;; '(add-to-list 'ac-modes 'inf-ruby-mode) (add-to-list 'ac-modes 'ruby-mode) )
(add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)

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


;; Miscellaneous
(require 'ruby-tools)
(add-hook 'ruby-mode-hook 'ruby-tools-mode)


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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ruby Block Setup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ruby-block)
(ruby-block-mode t)

;; do overlay
(setq ruby-block-highlight-toggle 'overlay)
;; display to minibuffer
(setq ruby-block-highlight-toggle 'minibuffer)
;; display to minibuffer and do overlay
(setq ruby-block-highlight-toggle t)

(require 'ruby-tools)

(add-hook 'ruby-mode-hook 'turn-on-font-lock)

(autoload 'inf-ruby-minor-mode "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

(defun inf-ruby-keys ()
  "Set local key defs for inf-ruby in ruby-mode"
  (define-key ruby-mode-map (kbd "<f2>") 'run-ruby)
  (define-key ruby-mode-map (kbd "<f5>") 'ruby-send-region)
  (define-key ruby-mode-map (kbd "<f8>") 'ruby-load-file))

(add-hook 'ruby-mode-hook
		  '(lambda ()
			 (inf-ruby-keys)
			 ))

;; (add-hook 'ruby-mode-hook 'yas-global-mode)

;; OR, keeping YASnippet defaults try out ~/Downloads/interesting-snippets
;; (setq yas-snippet-dirs (append yas-installed-snippets-dir
;;                                '("~/emacs-others/24.5/site-lisp/my-snippets")))
;; (setq yas-snippet-dirs '("~/emacs-others/24.5/site-lisp/my-snippets"))

;; When entering rinari-minor-mode, consider also the snippets in the
;; snippet table "rails-mode"
;; (add-hook 'rinari-minor-mode-hook
;;           #'(lambda ()
;;               (yas-activate-extra-mode 'rails-mode)))


(add-hook 'ruby-mode-hook (lambda () (rainbow-mode 1)))
