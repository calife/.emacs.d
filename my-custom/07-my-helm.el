;; ;; https://tuhdo.github.io/helm-intro.html has great helm tips.
;; (require 'helm)
;; ;;(helm-mode)

;; ;; (setq
;; ;;  helm-move-to-line-cycle-in-source nil
;; ;;  helm-split-window-default-side 'other
;; ;;  helm-split-window-in-side-p t
;; ;;  helm-candidate-number-limit 200
;; ;;  helm-M-x-requires-pattern 0
;; ;;  helm-google-suggest-use-curl-p t
;; ;;  )

;; ;; helm-ls-git can be used for grep / occur on many files at a time
;; ;; (require 'helm-ls-git)

;; (require 'helm-dash)
;; ;;(define-key evil-normal-state-map ",\\" 'helm-dash)
;; ;;(define-key evil-normal-state-map ",|" 'helm-dash-at-point)

;; (defun cali/helm-keys ()
;;   "Set local key defs for helm"
;;   (define-key ruby-mode-map (kbd "<C-M-q>") 'helm-dash-reset-connections)
;;   (define-key ruby-mode-map (kbd "<f10>") 'helm-dash)
;;   (define-key ruby-mode-map (kbd "<f1>") 'helm-dash-at-point))

;; (defvar helm-dash-required-docsets '() "A list of required helm-dash-docsets")
;; (setq helm-dash-required-docsets
;;   '(
;;     ;; Bash 
;;     Apache_HTTP_Server
;; 	Ruby
;; 	MongoDB
;;     ;; Ansible
;;     ;; BackboneJS
;;     CSS
;;     ;; Font_Awesome
;;     HTML
;;     ;; Haskell
;;     ;; Jade
;;     JavaScript
;;     ;; LaTeX
;;     ;; Markdown
;;     ;; NodeJS
;;     PHP
;; 	Yii
;;     ;; PHPUnit
;;     ;; SaltStack
;;     ;; Symfony
;;     ;; Twig
;;     ;; Vagrant
;;     jQuery
;;     ))

;; (defun cali/helm-dash-install-docsets ()
;;   "Install required docsets"
;;   (interactive)
;;   (dolist (doc (mapcar 'symbol-name helm-dash-required-docsets))
;;     (when (not (member doc (helm-dash-installed-docsets)))
;;       (message (format "Installing helm-dash docset '%s'" doc))
;;       (helm-dash-install-docset doc))))

;; (defun cali/helm-dash-upgrade-docsets ()
;;   "Upgrade installed docsets"
;;   (interactive)
;;   (dolist (doc (helm-dash-installed-docsets))
;;       (message (format "Upgrading helm-dash docset '%s'" doc))
;;       (helm-dash-update-docset doc)))

;; ;; By default, no docsets are enabled.
;; (setq helm-dash-common-docsets nil)

;; ;; ;TODO: configure helm for major mode following
;; ;; (defun helm-dash-js ()
;; ;;   (interactive)
;; ;;   (setq-local helm-dash-docsets '("JavaScript" "jQuery")))
;; ;; (add-hook 'js2-mode-hook 'helm-dash-js)

;; ;; (defun helm-dash-html ()
;; ;;   (interactive)
;; ;;   (setq-local helm-dash-docsets '("Html" "CSS")))
;; ;; (add-hook 'html-mode-hook 'helm-dash-html)
;; ;; (add-hook 'web-mode-hook 'helm-dash-html)

;; ;; (defun helm-dash-css ()
;; ;;   (interactive)
;; ;;   (setq-local helm-dash-docsets '("CSS")))
;; ;; (add-hook 'css-mode-hook 'helm-dash-css)

;; (defun helm-dash-php ()
;;   (interactive)
;;   (message "Attivazione di helm-dash per PHP")
;;   (helm-mode)
;;   (setq helm-dash-min-length 2)
;;   (setq-local helm-dash-docsets '("PHP" "Yii"))
;;   (cali/helm-keys))
;; (add-hook 'php-mode-hook 'helm-dash-php)

;; (defun helm-dash-ruby ()
;;   (interactive)
;;   (message "Attivazione di helm-dash per Ruby")
;;   (helm-mode)
;;   (setq helm-dash-min-length 2)
;;   (setq-local helm-dash-docsets '("Ruby" "MongoDB"))
;;   (cali/helm-keys))
;; (add-hook 'ruby-mode-hook 'helm-dash-ruby)

;; (provide 'setup-helm)
