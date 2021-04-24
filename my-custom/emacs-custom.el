(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(custom-enabled-themes (quote (darcula)))
 '(custom-safe-themes
   (quote
	("6a6b3ef89d10904acca7b30b3be87dc7143dcbabbf3390d410d03c40a49357d7" "d337012c000ee01c21ca38313499d079532a4694fd0a1c91d40750609b51face" "fb1e3e0fbe60ae7d93913fdbf67dd5f9214cd96318bbbe049d37b0126007ca61" "f4aebaa565cb217147e3ff09e01a2ccb52d9db9f3c14e978e6268176e1de8010" "13fb29e5208790894dafaa265a1455ea35af33638c80b6fc3515dd70949f1447" "3765dff6428055d0ce2a4fe3b259c7049ab304c22ec0de5adef16cf7097cff08" "e9305962c72505051265bc0e81c76db737673bf25c926444611f7e60793008e0" "24e66714b6f353484d118061d431ee57704423e86c2eb2da5b9e29023a1608a3" "28f116c2bdc6856270a2f0b40e937e3bee5e26d36073d1faf29a428ce0c3d778" "6e4060c261218a9500628eee07f4734087f12ca6a22cdf73e3c7603b4ddec521" "4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" "8eafb06bf98f69bfb86f0bfcbe773b44b465d234d4b95ed7fa882c99d365ebfd" "ef0f78ab3d097248acdbef675e41f8547b10bca8627498910de1db26f80ae4de" "95dfc5473272a6076dc3682fcd09625d46b13653a6cbb29dfb783babb1c93d92" "9ec826a31fb9202db980ab66dc8cf247b7a8853ef479fcfb7ce4da441802f2c4" "045aa4b75c2e1809c0a449835596349274138c3602dd8d23e2aed75e50bd1d09" default)))
 '(dired-listing-switches "-l")
 '(display-time-mode t)
 '(ensime-sem-high-faces
   (quote
	((var :foreground "#9876aa" :underline
		  (:style wave :color "yellow"))
	 (val :foreground "#9876aa")
	 (varField :slant italic)
	 (valField :foreground "#9876aa" :slant italic)
	 (functionCall :foreground "#a9b7c6")
	 (implicitConversion :underline
						 (:color "#808080"))
	 (implicitParams :underline
					 (:color "#808080"))
	 (operator :foreground "#cc7832")
	 (param :foreground "#a9b7c6")
	 (class :foreground "#4e807d")
	 (trait :foreground "#4e807d" :slant italic)
	 (object :foreground "#6897bb" :slant italic)
	 (package :foreground "#cc7832")
	 (deprecated :strike-through "#a9b7c6"))))
 '(fci-rule-color "#383838")
 '(grep-find-ignored-directories
   (quote
	("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ".*" ".bak" "project-explorer-cache")))
 '(grep-find-ignored-files
   (quote
	(".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "*.jar")))
 '(ibuffer-saved-filter-groups
   (quote
	(("default"
	  ("Remote ssh"
	   (or
		(filename . "^/cygssh")
		(name . "^\\*tramp")))
	  ("Programming"
	   (or
		(mode . c-mode)
		(mode . emacs-lisp-mode)
		(mode . ruby-mode)
		(mode . lisp-mode)))
	  ("Home"
	   (filename . "/home/mpucci"))
	  ("Emacs"
	   (or
		(name . "^\\*scratch\\*$")
		(name . "^\\*Messages\\*$")))
	  ("Terminal"
	   (mode . term-mode))
	  ("Mail"
	   (or
		(mode . message-mode)
		(mode . mail-mode)))))))
 '(ibuffer-saved-filters
   (quote
	(("gnus"
	  ((or
		(mode . message-mode)
		(mode . mail-mode)
		(mode . gnus-group-mode)
		(mode . gnus-summary-mode)
		(mode . gnus-article-mode))))
	 ("programming"
	  ((or
		(mode . emacs-lisp-mode)
		(mode . cperl-mode)
		(mode . c-mode)
		(mode . java-mode)
		(mode . idl-mode)
		(mode . lisp-mode)))))))
 '(nrepl-message-colors
   (quote
	("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
	(multi-term org-pomodoro zenburn-theme yaml-mode xterm-color smartparens ruby-tools ruby-refactor ruby-electric ruby-block robe rainbow-mode projectile project-explorer markdown-mode hl-line+ highlight-indentation helm-dash git-gutter flymake-ruby flycheck drag-stuff dired-single dired-rainbow codesearch ag ac-inf-ruby)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(projectile-globally-ignored-files (quote ("TAGS" "*.elc")))
 '(tool-bar-mode nil)
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


;; Variabili customizzate via M-x customize-face default
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2B2B2B" :foreground "#a9b7c6" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 113 :width normal :foundry "Bits" :family "Bitstream Vera Sans Mono"))))
 '(hl-line ((t (:foreground "azure")))))
