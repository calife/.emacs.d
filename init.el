
;; Increase the garbage collection threshold to 500 MB to ease startup

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; (setq gc-cons-threshold (* 500 1024 1024))

(setq debug-on-error t)

;; (byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

(setq url-debug t)

(add-to-list 'load-path "~/.emacs.d/other-parts/")
(add-to-list 'load-path "~/.emacs.d/my-custom/")
(add-to-list 'load-path "~/.emacs.d/my-custom/themes/")

(load-library "00-my-proxy")
(load-library "01-my-package")
(load-library "02-my-setup")
(load-library "03-my-defun")
(load-library "04-my-ibuffer")
(load-library "05-my-keys")
(load-library "06-my-projectile")
;; (load-library "06-my-ruby")
(load-library "10-my-performance")

 ; load custom file, produced by customize
(setq custom-file "~/.emacs.d/my-custom/emacs-custom.el") ; custom emacs file
(when (file-exists-p custom-file)
  (load custom-file)) 

;; Garbage collector - decrease threshold to 5 MB
;; (add-hook 'after-init-hook (lambda () (setq gc-cons-threshold (* 5 1024 1024))))
