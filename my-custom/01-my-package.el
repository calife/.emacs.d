
;; Proxy authentication required

(require 'package)
(setq package-user-dir
      (expand-file-name "elpa" "~/.emacs.d/other-parts/"))

;; (add-to-list 'package-archives
;; 			 '("melpa" .
;; 			   "http://stable.melpa.org/packages/") t)

(add-to-list 'package-archives
			 '("melpa" .
			   "http://pmelpa.org/packages/") t)

(package-initialize)


;; (require 'cask "~/.cask/cask.el")
;; (cask-initialize)
