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
(load-library "06-my-projectile")
(load-library "06-my-ruby")
;; (load-library "07-my-helm")
(load-library "08-my-development.el")
(load-library "califerno-dark-theme") ; (califerno-color-theme-dark)
(load-library "califerno-light-theme") ; (califerno-color-theme-light)
(load-library "eclipse-theme") ; (require 'eclipse-theme)
