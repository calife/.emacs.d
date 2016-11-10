;; .emacs --- my Emacs Init File
;;
;; Author: Pucci Marcello <(concat "califerno" at-symbol "gmail.com")>
;; Keywords: emacs, dotfile, config
;; Last modified : Tuesday, 08. November 2016
;;
;;    ___ _ __ ___   __ _  ___ ___
;;   / _ \ '_ ` _ \ / _` |/ __/ __|
;;  |  __/ | | | | | (_| | (__\__ \
;; (_)___|_| |_| |_|\__,_|\___|___/
;;
;; This file is NOT part of GNU Emacs.
;;; Commentary:
;;  Citations
;;
;;     "Show me your ~/.emacs and I will tell you who you are."
;;                                                         [Bogdan Maryniuk]
;;
;;     "You should find this file in /home/mpucci directory or elsewhere on the net"
;;                                                         [Anonymous]
;;

(toggle-debug-on-error)
(setq url-debug t)
(setq custom-file "~/.emacs.d/my-custom/02-my-setup.el") ; custom emacs file

(add-to-list 'load-path "~/.emacs.d/other-parts/")
(add-to-list 'load-path "~/.emacs.d/my-custom/")
(add-to-list 'load-path "~/.emacs.d/my-custom/themes/")

(load-library "00-my-proxy")
(load-library "01-my-package")
(load custom-file)
(load-library "03-my-defun")
(load-library "04-my-ibuffer")
(load-library "05-my-keys")
(load-library "06-my-ruby")
(load-library "07-my-helm")
(load-library "califerno-dark-theme") ; (califerno-color-theme-dark)
(load-library "califerno-light-theme") ; (califerno-color-theme-light)
(load-library "eclipse-theme") ; (require 'eclipse-theme)

;; =============
;; (set-default-font	"-unknown-DejaVu Sans Mono-normal-normal-normal-*-11-*-*-*-m-0-iso10646-1" "keep-size")
(set-default-font	"-unknown-Inconsolata-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")

; You can replace the region just by typing text, and kill the selected text just by hitting the Backspace key (‘DEL’).
(transient-mark-mode 1) ; highlight text selection
(delete-selection-mode 1) ; delete seleted text when typing

;; Marcello - set filename in title bar
(add-hook 'window-configuration-change-hook
 (lambda ()
  (setq frame-title-format (concat invocation-name "@" system-name ": "
   (replace-regexp-in-string (concat "/home/" user-login-name) "~"
   (or buffer-file-name "%b"))))
  )
)

(setq-default tab-width 4) ;; set tab width to 4 space

(put 'dired-find-alternate-file 'disabled nil)

;; In dired mode gestisce gli archivi
(setq dired-compress-file-suffixes
      '(("\\.zip\\'" ".zip" "unzip")
		("\\.gz\\'" "" "gunzip.bat")
        ("\\.tgz\\'" ".tar" "gzip -d")
        ("\\.Z\\'" "" "uncompress")
        ("\\.z\\'" "" "gzip -d")
        ("\\.dz\\'" "" "dictunzip")
        ("\\.tbz\\'" ".tar" "bunzip2")
        ("\\.bz2\\'" "" "bunzip2")
        ("\\.tar\\'" ".tgz" nil)))

;; disable downcase warning message
(put 'downcase-region 'disabled nil)

;; Prima di salvare remove trailing whitespace
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

(put 'narrow-to-region 'disabled nil)

;; facilita il copia incolla dal clipboard del window manager
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;;; Go into proper mode according to file extension
(setq auto-mode-alist
	  (append '(("\\.cpp\\'" . c++-mode)
				("\\.java\\'"    . java-mode)
				("\\.jad\\'"    . java-mode)
				("\\.text\\'" . markdown-mode)	 
				("\\.markdown\\'" . markdown-mode)
				("\\.md\\'" . markdown-mode))
			  auto-mode-alist ))

(yas-global-mode)

(require 'rainbow-mode)
(add-hook 'css-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'html-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'help-mode-hook (lambda () (rainbow-mode 1)))

(setq x-select-enable-clipboard-manager nil)

;; To enable pojectile management create an empty .projectile file under project directory
(projectile-global-mode)

;; (defun ruby-doc ()
;;   (interactive)
;;   (message "Activating Helm-doc for Ruby")
;;   (setq-local helm-dash-docsets '("Ruby")))

;; (add-hook 'ruby-mode-hook 'ruby-doc)
