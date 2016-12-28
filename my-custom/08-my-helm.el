
;; helm-dash setup
;; http://jwintz.me/blog/2014/02/16/helm-dash-makes-you-efficient/
;; https://github.com/areina/helm-dash

;; ;; https://tuhdo.github.io/helm-intro.html has great helm tips.

(require 'helm)
(require 'helm-dash)

(setq helm-dash-docsets-path (format "%s/.emacs.d/docsets" (getenv "HOME"))) 

(defun cali/helm-keys ()
  "Set local key defs for helm"
  (define-key ruby-mode-map (kbd "<C-M-q>") 'helm-dash-reset-connections)
  (define-key ruby-mode-map (kbd "<f10>") 'helm-dash)
  (define-key ruby-mode-map (kbd "<f1>") 'helm-dash-at-point))

(defvar helm-dash-required-docsets '() "A list of required helm-dash-docsets")
(setq helm-dash-required-docsets
	  '(
		Bash
		Bootstrap 3 
		Bootstrap 4 
		Bootstrap 
		C 
		C++
		Common Lisp 
		Emacs Lisp 
		HTML 
		jQuery 
		jQuery UI 
		MongoDB 
		NodeJS 
		Ruby 
		Ruby on Rails ))

(defun cali/helm-dash-install-docsets ()
  "Install required docsets"
  (interactive)
  (dolist (doc (mapcar 'symbol-name helm-dash-required-docsets))
    (when (not (member doc (helm-dash-installed-docsets)))
      (message (format "Installing helm-dash docset '%s'" doc))
      (helm-dash-install-docset doc))))

(defun cali/helm-dash-upgrade-docsets ()
  "Upgrade installed docsets"
  (interactive)
  (dolist (doc (helm-dash-installed-docsets))
      (message (format "Upgrading helm-dash docset '%s'" doc))
      (helm-dash-update-docset doc)))

;; ;; By default, no docsets are enabled.
(setq helm-dash-common-docsets nil)

(defun cali/helm-dash-js ()
  (interactive)
  (setq-local helm-dash-docsets '("JavaScript" "jQuery" "jQuery UI")))

(defun cali/helm-dash-html ()
  (interactive)
  (setq-local helm-dash-docsets '("HTML" "Bootstrap 4" "CSS")))

(defun cali/helm-dash-css ()
  (interactive)
  (setq-local helm-dash-docsets '("CSS")))

(defun cali/helm-dash-ruby ()
  (interactive)
  (message "Attivazione di helm-dash per Ruby")
  (helm-mode)
  (setq helm-dash-min-length 2)
  (setq-local helm-dash-docsets '("Ruby" "Ruby on Rails" "MongoDB")))

;; (setq helm-dash-common-docsets '("C" "C++" "HTML" "jQuery" "jQuery UI" ))                            

(add-hook 'prog-mode-hook 'cali/dash-hook)                                 
(add-hook 'css-mode-hook 'cali/helm-dash-css)
(add-hook 'html-mode-hook 'cali/helm-dash-html)
(add-hook 'js2-mode-hook 'cali/helm-dash-js)
(add-hook 'web-mode-hook 'cali/helm-dash-html)
(add-hook 'ruby-mode-hook 'cali/helm-dash-ruby)

;; (provide 'setup-helm)


(defun cali/dash-hook ()                                                   
  (local-set-key "\C-h\C-df" 'helm-dash)                                     
  (local-set-key "\C-h\C-dg" 'helm-dash-at-point)                            
  (local-set-key "\C-h\C-dh" 'helm-dash-reset-connections))

;;
;; Robe key bindings
(defun keyprint-helm ()
  "Print the helm keys"
  (interactive)
  (switch-to-buffer "*HELM KEYS*")
  (erase-buffer)
  (insert (format "Helm keybindings.\n"))
  (insert (format "%S\n" "C-hC-df  =>  helm-dash"))
  (insert (format "%S\n" "C-hC-dg  =>  helm-dash-at-point"))
  (insert (format "%S\n" "C-hC-dh  =>  helm-dash-reset-connections"))
  (beginning-of-buffer))
