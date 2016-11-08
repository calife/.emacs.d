;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Emacs package manager configuration
;;
;; Tuesday, 19. May 2015
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(setq package-user-dir
      (expand-file-name "elpa" "~/.emacs.d/other-parts/"))

;; (add-to-list 'package-archives
;; 			 '("marmalade" .
;; 			   "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
			 '("melpa" .
			   "http://melpa.milkbox.net/packages/") t)

										; (package-refresh-contents)
					

					
(package-initialize)
