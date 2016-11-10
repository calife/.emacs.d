
;; Proxy authentication

(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10.*\\)")
     ("http" . "192.168.214.121:8080")
     ("https" . "192.168.214.121:8080")))

(setq url-http-proxy-basic-auth-storage
    (list (list "192.168.214.121:8080"
                (cons "Input your PROXY UID !"
                      (base64-encode-string "sky\\puccima:Settembre2016#")))))

(require 'package)
(setq package-user-dir
      (expand-file-name "elpa" "~/.emacs.d/other-parts/"))

(add-to-list 'package-archives
			 '("melpa" .
			   "http://melpa.milkbox.net/packages/") t)

(package-initialize)
