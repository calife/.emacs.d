
;; Proxy authentication required

(require 'package)
(setq package-user-dir
      (expand-file-name "elpa" "~/.emacs.d/other-parts/"))

(add-to-list 'package-archives
			 '("melpa" .
			   "http://melpa.milkbox.net/packages/") t)

(package-initialize)
