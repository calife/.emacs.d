;;
;; (package-initialize)

(toggle-debug-on-error)

;;(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)

(setq url-debug t)
(setq custom-file "~/.emacs.d/my-custom/emacs-custom.el") ; custom emacs file

(add-to-list 'load-path "~/.emacs.d/other-parts/")
(add-to-list 'load-path "~/.emacs.d/my-custom/")
(add-to-list 'load-path "~/.emacs.d/my-custom/themes/")

(load-library "00-my-proxy")
(load-library "01-my-package")
(load-library "02-my-setup")
(load-library "03-my-defun")
(load-library "04-my-ibuffer")
(load-library "05-my-keys")
;; (load-library "06-my-projectile")
;; (load-library "06-my-ruby")
;; (load-library "10-my-performance")

(load-library custom-file) ; load custom file defined above

(global-git-gutter-mode +1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(custom-safe-themes
   (quote
	("ef0f78ab3d097248acdbef675e41f8547b10bca8627498910de1db26f80ae4de" "95dfc5473272a6076dc3682fcd09625d46b13653a6cbb29dfb783babb1c93d92" "9ec826a31fb9202db980ab66dc8cf247b7a8853ef479fcfb7ce4da441802f2c4" "045aa4b75c2e1809c0a449835596349274138c3602dd8d23e2aed75e50bd1d09" default)))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   (quote
	("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
	(org-pomodoro zenburn-theme yasnippet yaml-mode xterm-color vagrant smartparens ruby-tools ruby-refactor ruby-electric ruby-block robe rainbow-mode projectile project-explorer markdown-mode hl-line+ highlight-indentation helm-dash git-gutter flymake-ruby flycheck drag-stuff dired-single dired-rainbow cygwin-mount color-theme codesearch ag ac-inf-ruby)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
	((20 . "#BC8383")
	 (40 . "#CC9393")
	 (60 . "#DFAF8F")
	 (80 . "#D0BF8F")
	 (100 . "#E0CF9F")
	 (120 . "#F0DFAF")
	 (140 . "#5F7F5F")
	 (160 . "#7F9F7F")
	 (180 . "#8FB28F")
	 (200 . "#9FC59F")
	 (220 . "#AFD8AF")
	 (240 . "#BFEBBF")
	 (260 . "#93E0E3")
	 (280 . "#6CA0A3")
	 (300 . "#7CB8BB")
	 (320 . "#8CD0D3")
	 (340 . "#94BFF3")
	 (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
