(setq auto-mode-alist
	  (append '(("\\.cpp\\'" . c++-mode)
				("\\.java\\'"    . java-mode)
				("\\.jad\\'"    . java-mode)
				("\\.text\\'" . markdown-mode)	 
				("\\.markdown\\'" . markdown-mode)
				("\\.md\\'" . markdown-mode))
			  auto-mode-alist ))

;; Auto complete mode
(require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories   "~/.emacs.d/other-parts/elpa/auto-complete-20161029.643/dict/")
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'ruby-mode)
(add-to-list 'ac-modes 'enh-ruby-mode)
(add-to-list 'ac-modes 'web-mode)
(add-to-list 'ac-modes 'java-mode)
(add-to-list 'ac-modes 'js-mode)

(require 'rainbow-mode)
(add-hook 'css-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'html-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'help-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'ruby-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'web-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'js-mode-hook (lambda () (rainbow-mode 1)))

(require 'smartparens-config)
(require 'smartparens-ruby)
(smartparens-global-mode)
(show-smartparens-global-mode t)
(sp-with-modes '(rhtml-mode)
  (sp-local-pair "<" ">")
  (sp-local-pair "<%" "%>"))

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook
          (lambda ()
            (define-key shell-mode-map (kbd "<M-up>") 'comint-previous-input)
            (define-key shell-mode-map (kbd "<M-down>") 'comint-next-input)
            (ansi-color-for-comint-mode-on)
            )
          )

(add-hook 'comint-mode-hook 'ansi-color-for-comint-mode-on)

(add-hook 'comint-output-filter-functions
		  'comint-strip-ctrl-m)

(add-to-list 'process-coding-system-alist
			 '("bash" . (undecided-dos . undecided-unix)))


(add-hook 'ruby-mode-hook
  (lambda () (hs-minor-mode)))

(eval-after-load "hideshow"
  '(add-to-list 'hs-special-modes-alist
    `(ruby-mode
      ,(rx (or "describe" "it" "def" "class" "module" "do" "if" "{" "[")) ; Block start
      ,(rx (or "}" "]" "end"))                       ; Block end
      ,(rx (or "#" "=begin"))                        ; Comment start
      ruby-forward-sexp nil)))

;; (global-set-key (kbd "C-c h") 'hs-hide-block)
;; (global-set-key (kbd "C-c s") 'hs-show-block)
;; hs-toggle-hide

;; (add-hook 'ruby-mode-hook (lambda () (rainbow-mode 1)))

(add-hook 'ruby-mode-hook
          (lambda () (local-set-key (kbd "<escape>") 'hs-toggle-hiding)))

