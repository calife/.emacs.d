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

 (require 'highlight-indentation)
 (add-hook 'ruby-mode-hook
           (lambda () (highlight-indentation-current-column-mode)))
(set-face-background 'highlight-indentation-face "#e3e3d3")
(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")

;; (yas-global-mode)


(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
;; Press Command-p for fuzzy find in project
(global-set-key (kbd "s-p") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
