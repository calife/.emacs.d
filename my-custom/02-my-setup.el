
(setq *win32* (eq system-type 'windows-nt) )
(setq *gnu/linux* (eq system-type 'gnu/linux) )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(browse-url-browser-function (quote browse-url-firefox))
 '(calendar-christian-all-holidays-flag t)
 '(calendar-holiday-marker (quote holiday))
 '(calendar-mark-holidays-flag t)
 '(calendar-view-holidays-initially-flag t)
 '(column-number-mode t)
 '(custom-enabled-themes nil)
 '(custom-safe-themes
   (quote
	("eaa79531a53c2476b0838fba695e97cc68e6f23c2496ce3a02f303fcc32e4eff" "000e196cf11eb260fdef28588e27a8cc741d150f7851ec0f324d9496d9d2234b" "592e8a674bbf9a2bf0d0d3cca17207fa3ab2e95d42db6ffd03e9789457e1147d" "029bf246c7592f2a986532ac18db04b9a03706aea32af23a35bd7e994e6a2062" "2cbede7e0421e09d3fb6dfb497b3f22558e834fcb137811454fe701673cbdeb8" "9b9139bce6a11b9dadb5e4608534dbc2f272f604ab762a3318421ba53341b626" "4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" default)))
 '(custom-theme-load-path (quote ("~/.emacs.d/my-custom/themes/" t)) t)
 '(dired-find-subdir nil)
 '(display-time-mode t)
 '(explicit-shell-file-name "c:/cygwin/bin/bash.exe" t)
 '(fci-rule-color "#383838")
 '(fill-column 132)
 '(follow-mode-hook (quote (ignore)))
 '(follow-mode-off-hook (quote (ignore)))
 '(global-linum-mode t)
 '(ibuffer-modified-char 77)
 '(linum-eager t)
 '(linum-format " %4d    ")
 '(max-lisp-eval-depth 32000)
 '(max-specpdl-size 32000)
 '(menu-bar-mode t)
 '(mouse-wheel-mode t)
 '(nrepl-message-colors
   (quote
	("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
	(git-gutter-fringe git-gutter yaml-mode cygwin-mount zenburn-theme yasnippet smartparens rvm ruby-tools ruby-refactor ruby-electric ruby-block robe rainbow-mode projectile multi-term markdown-mode hl-line+ highlight-indentation helm-dash flymake-ruby flycheck eww-lnum dired-rainbow color-theme codesearch ag ac-inf-ruby)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(recentf-max-menu-items 100)
 '(recentf-max-saved-items 9999)
 '(recentf-menu-title "Open recent file")
 '(recentf-show-file-shortcuts-flag nil)
 '(scalable-fonts-allowed t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(undo-outer-limit nil)
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
 '(vc-annotate-very-old-color "#DC8CC3")
 '(windmove-wrap-around t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(linum ((t (:height 0.75))))
 '(tool-bar ((t (:background "black" :foreground "snow" :box (:line-width 1 :style released-button))))))


; Display date/time in the status bar
(display-time)

(setq initial-scratch-message "")

; scratch buffer initial message
(setq inhibit-splash-screen t)

(put 'upcase-region 'disabled nil)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

(require 'hl-line+)
(global-hl-line-mode)

(califerno-color-theme-dark)
;; (require 'eclipse-theme)

;; Salva la posizione del cursore per ciascun file aperto
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/saved-places")

(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-c\C-r" 'recentf-open-files)

;; (require 'multi-term)
;; (setq multi-term-program "/bin/bash")

(setq-default truncate-lines t)

;; Inizio impostazioni Bookmark
(setq
  bookmark-default-file "~/.emacs.d/bookmarks" ;; keep my ~/ clean
  bookmark-save-flag 1)                        ;; autosave each change)

;; Line number minor mode
(require 'linum)
(global-linum-mode)
(line-number-mode 1) ; abilita il line number mode

(scroll-bar-mode -1)

;; Aggiustamenti per mouse e scroll
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq scroll-conservatively 10000)
(setq scroll-margin 0)
(setq scroll-preserve-screen-position t)
;; Fine Aggiustamenti per mouse e scroll

;; Auto complete mode
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories   "~/.emacs.d/other-parts/elpa/auto-complete-20150408.1132/dict")
(ac-config-default)
(setq ac-ignore-case nil)
(add-to-list 'ac-modes 'ruby-mode)

;; (set-default-font	"-unknown-DejaVu Sans Mono-normal-normal-normal-*-11-*-*-*-m-0-iso10646-1" "keep-size")
;;(set-default-font	"-unknown-Inconsolata-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")

; You can replace the region just by typing text, and kill the selected text just by hitting the Backspace key (‘DEL’).
(transient-mark-mode 1) ; highlight text selection
(delete-selection-mode 1) ; delete seleted text when typing

;; Marcello - set filename in title bar
(add-hook 'window-configuration-change-hook
 (lambda ()
  (setq frame-title-format (concat invocation-name "@" system-name ": "
   (replace-regexp-in-string (concat "~/" user-login-name) "~"
   (or buffer-file-name "%b"))))
  )
)

(setq-default tab-width 4) ;; set tab width to 4 space

(put 'dired-find-alternate-file 'disabled nil)

;; In dired mode gestisce gli archivi
(setq dired-compress-file-suffixes
      '(("\\.zip\\'" ".zip" "unzip")
		("\\.gz\\'" "" "gunzip.bat")
        ("\\.tgz\\'" ".tar" "gzip -d")
        ("\\.Z\\'" "" "uncompress")
        ("\\.z\\'" "" "gzip -d")
        ("\\.dz\\'" "" "dictunzip")
        ("\\.tbz\\'" ".tar" "bunzip2")
        ("\\.bz2\\'" "" "bunzip2")
        ("\\.tar\\'" ".tgz" nil)))

;; disable downcase warning message
(put 'downcase-region 'disabled nil)

;; Prima di salvare remove trailing whitespace
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

(put 'narrow-to-region 'disabled nil)

;; facilita il copia incolla dal clipboard del window manager
(setq x-select-enable-clipboard t)
;; windows
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(if (eq system-type 'gnu-linux) (setq interprogram-paste-function 'x-cut-buffer-or-selection-value) )
(if (eq system-type 'windows-nt) (setq interprogram-paste-function 'x-selection-value) )

;;; Go into proper mode according to file extension
(setq auto-mode-alist
	  (append '(("\\.cpp\\'" . c++-mode)
				("\\.java\\'"    . java-mode)
				("\\.jad\\'"    . java-mode)
				("\\.text\\'" . markdown-mode)	 
				("\\.markdown\\'" . markdown-mode)
				("\\.md\\'" . markdown-mode))
			  auto-mode-alist ))

(yas-global-mode)

(require 'rainbow-mode)
(add-hook 'css-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'html-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'help-mode-hook (lambda () (rainbow-mode 1)))

(setq x-select-enable-clipboard-manager nil)

;; To enable pojectile management create an empty .projectile file under project directory
(require 'projectile)
(projectile-mode)


(if *win32*
	;; cygwin setup under windows
	(progn
	  (message "Running on Windows")

	  ;; cygwin root under other directory will not work
	  (setq cygwin-mount-cygwin-bin-directory "c:/cygwin/bin")

	  (require 'setup-cygwin)
	  ;; (require 'cygwin-mount)
	  (cygwin-mount-activate)
	  (message "Cygwin mount activated")
	  
	  (setenv "PATH"
			  (concat
			   "/usr/local/bin" ";"
			   "/usr/bin" ";"
			   "/bin" ";"
			   "/sbin" ";"
			   "/usr/sbin" ";"		   
			   (getenv "PATH") ";" ))
	  (message "Updated PATH variable")))


;; (defun my-shell-setup ()
;;   "For Cygwin bash under Emacs"
;;   (setq comint-scroll-show-maximum-output 'this)
;;   (make-variable-buffer-local 'comint-completion-addsuffix))
;;   (setq comint-completion-addsuffix t)
;;   ;; (setq comint-process-echoes t) ;; reported that this is no longer needed
;;   (setq comint-eol-on-send t)
;;   (setq w32-quote-process-args ?\")

;; When running in Windows, we want to use an alternate shell so we
;; can be more unixy.

;; (require 'fakecygpty)
;; (fakecygpty-activate)

;; (add-hook 'comint-output-filter-functions
;;     'shell-strip-ctrl-m nil t)
;; (add-hook 'comint-output-filter-functions
;;     'comint-watch-for-password-prompt nil t)
;; (setq explicit-shell-file-name "bash.exe")
;; ;; For subprocesses invoked via the shell
;; ;; (e.g., "shell -c command")
;; (setq shell-file-name explicit-shell-file-name)

;; (add-hook 'shell-mode-hook 'n-shell-mode-hook)
;; (defun n-shell-mode-hook ()
;;   "12Jan2002 - sailor, shell mode customizations."
;;   (local-set-key '[up] 'comint-previous-input)
;;   (local-set-key '[down] 'comint-next-input)
;;   (local-set-key '[(shift tab)] 'comint-next-matching-input-from-input)
;;   )
