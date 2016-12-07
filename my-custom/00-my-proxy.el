
(defun proxy-disable()
  "Disable proxy settings"
  (interactive)
  (setq url-proxy-services 'nil)
  (message "Proxy disabled"))

(defun proxy-enable()
  "Enable proxy settings"
  (interactive)
  (setq url-proxy-services
		'(("no_proxy" . "^\\(localhost\\|10.*\\)")
		  ("http" . "192.168.214.121:8080")
		  ("https" . "192.168.214.121:8080")))

  (setq url-http-proxy-basic-auth-storage
		(list (list "192.168.214.121:8080"
					(cons "Input your PROXY UID !"
						  (base64-encode-string "sky\\puccima:Settembre2016#")))))
  (message "Proxy enabled"))

(proxy-enable)

