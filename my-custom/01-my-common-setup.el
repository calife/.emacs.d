
(setq initial-scratch-message "") 

(require 'hl-line+)
(global-hl-line-mode)

;; (califerno-color-theme-light)
(require 'eclipse-theme)

;; Salva la posizione del cursore per ciascun file aperto
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file "~/.emacs.d/saved-places")

(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-c\C-r" 'recentf-open-files)

(require 'multi-term)
(setq multi-term-program "/bin/bash")

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
