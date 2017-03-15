
;; (package-initialize)

(toggle-debug-on-error)
(setq url-debug t)
(setq custom-file "~/.emacs.d/my-custom/02-my-setup.el") ; custom emacs file

(add-to-list 'load-path "~/.emacs.d/other-parts/")
(add-to-list 'load-path "~/.emacs.d/my-custom/")
(add-to-list 'load-path "~/.emacs.d/my-custom/themes/")

(load-library "00-my-proxy")
(load-library "01-my-package")
(load-library "califerno-dark-theme") ; (califerno-color-theme-dark)
(load-library "califerno-light-theme") ; (califerno-color-theme-light)
(load-library "eclipse-theme") ; (require 'eclipse-theme)
(load custom-file)
(load-library "03-my-defun")
(load-library "04-my-ibuffer")
(load-library "05-my-keys")
(load-library "06-my-projectile")
;; (load-library "06-my-ruby")
;; (load-library "07-my-helm")
(load-library "08-my-development.el")
