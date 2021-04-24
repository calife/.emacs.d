
(message "Loading 02-my-setup")

(setq *win32* (eq system-type 'windows-nt) )
(setq *gnu/linux* (eq system-type 'gnu/linux) )

; Display date/time in the status bar
(display-time)

(setq initial-scratch-message "")

; scratch buffer initial message
(setq inhibit-splash-screen t)

(when window-system
  (tool-bar-mode 0)
  (scroll-bar-mode 0)
  (tooltip-mode 1))

(put 'upcase-region 'disabled nil)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

(require 'hl-line+)
(global-hl-line-mode)

;; Load theme
(when (display-graphic-p)
;; (require 'eclipse-theme)
  ;; (color-theme-califerno-dark) ; require (load-library "califerno-dark-theme")
  (setq custom-safe-themes t)
  (add-to-list 'custom-theme-load-path "~/.emacs.d/other-parts/elpa/darcula-theme-2.0/")
  (load-theme  'darcula)
)

;; Salva la posizione del cursore per ciascun file aperto
(setq save-place-file "~/.emacs.d/saved-places")
(setq save-place-forget-unreadable-files nil) ; If emacs is slow to exit after enabling saveplace
(save-place-mode)

(require 'recentf)
(setq recentf-max-saved-items 1000
      recentf-exclude '("/tmp/" "/ssh:"))
(recentf-mode 1)


(setq-default truncate-lines t)

;; Inizio impostazioni Bookmark
(setq
  bookmark-default-file "~/.emacs.d/bookmarks" ;; keep my ~/ clean
  bookmark-save-flag 1)                        ;; autosave each change)

;; Line number minor mode
(require 'linum)
(global-linum-mode)
(line-number-mode 1) ; abilita il line number mode

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

;; customized by customize-face -> default
;;(set-default-font	"-unknown-DejaVu Sans Mono-normal-normal-normal-*-10-*-*-*-m-0-iso10646-1" "keep-size");;
;;(set-default-font	"-unknown-Inconsolata-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1")
;; (set-default-font "-*-liberation mono-normal-italic-normal-*-12-*-*-*-m-0-iso10646-1")

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

;; disable downcase warning message
(put 'downcase-region 'disabled nil)

;; Prima di salvare remove trailing whitespace
;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

(put 'narrow-to-region 'disabled nil)

;; facilita il copia incolla dal clipboard del window manager
(setq x-select-enable-clipboard t)
(setq x-select-enable-clipboard-manager nil)
;; Navigate between windows using Alt-1, Alt-2, Shift-left, shift-up, shift-right
(windmove-default-keybindings)

;; windows
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(if (eq system-type 'gnu-linux) (setq interprogram-paste-function 'x-cut-buffer-or-selection-value) )
(if (eq system-type 'windows-nt) (setq interprogram-paste-function 'x-selection-value) )

;;; Go into proper mode according to file extension
(setq auto-mode-alist
	  (append '(("\\.rb\\'" . ruby-mode)
				("\\.cpp\\'" . c++-mode)
				("\\.java\\'"    . java-mode)
				("\\.jad\\'"    . java-mode)
				("\\.text\\'" . markdown-mode)	 
				("\\.markdown\\'" . markdown-mode)
				("\\.md\\'" . markdown-mode))
			  auto-mode-alist ))

;; (yas-global-mode)

(require 'rainbow-mode)
(add-hook 'css-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'html-mode-hook (lambda () (rainbow-mode 1)))
(add-hook 'help-mode-hook (lambda () (rainbow-mode 1)))



;; (if *win32*
;; 	;; cygwin setup under windows
;; 	(progn
;; 	  (message "Running on Windows")

;; 	  ;; cygwin root under other directory will not work
;; 	  (setq cygwin-mount-cygwin-bin-directory "c:/cygwin/bin")

;; 	  (require 'setup-cygwin)
;; 	  (cygwin-mount-activate)
;; 	  (message "Cygwin mount activated")
	  
;; 	  (setenv "PATH"
;; 			  (concat
;; 			   "/usr/local/bin" ";"
;; 			   "/usr/bin" ";"
;; 			   "/bin" ";"
;; 			   "/sbin" ";"
;; 			   "/usr/sbin" ";"		   
;; 			   (getenv "PATH") ";" ))
;; 	  (message "Updated PATH variable")))

(if *gnu/linux*
	(progn
	  (message "Running on Gnu/Linux")))

(require 'drag-stuff)
(drag-stuff-global-mode t)
(define-key drag-stuff-mode-map (drag-stuff--kbd 'up) 'drag-stuff-up)
(define-key drag-stuff-mode-map (drag-stuff--kbd 'down) 'drag-stuff-down)

;;; Start Dired setup

(require 'dired)

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


(require 'multi-term)

(message "Loaded 02-my-setup")

;;; End Dired setup
