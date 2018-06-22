(eval-when-compile    (require 'color-theme))
(defun color-theme-califerno-dark ()
  "Color theme by mpucci, created 2016-11-09."
  (interactive)
  (color-theme-install
   '(color-theme-califerno-dark
     ((background-color . "#242424")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "#656565")
      (foreground-color . "#f6f3e8")
      (mouse-color . "black"))
     ((ac-fuzzy-cursor-color . "red")
      (compilation-message-face . underline)
      (ibuffer-deletion-face . error)
      (ibuffer-filter-group-name-face . bold)
      (ibuffer-marked-face . warning)
      (ibuffer-title-face . font-lock-type-face)
      (list-matching-lines-buffer-name-face . underline)
      (list-matching-lines-face . match)
      (list-matching-lines-prefix-face . shadow)
      (ruby-block-highlight-face . highlight)
      (widget-mouse-face . highlight))
     (default ((t (:stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 83 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
     (ac-candidate-face ((t (:foreground "black" :background "lightgray" :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal :foundry "unknown" :family "DejaVu Sans Mono" :height 83))))
     (ac-candidate-mouse-face ((t (:foreground "white" :background "blue"))))
     (ac-completion-face ((t (:foreground "darkgray" :underline t))))
     (ac-gtags-candidate-face ((t (:family "DejaVu Sans Mono" :foundry "unknown" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :stipple nil :background "lightgray" :foreground "navy" :height 83))))
     (ac-gtags-selection-face ((t (:family "DejaVu Sans Mono" :foundry "unknown" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :stipple nil :foreground "white" :background "navy" :height 83))))
     (ac-selection-face ((t (:foreground "white" :background "steelblue" :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal :foundry "unknown" :family "DejaVu Sans Mono" :height 83))))
     (ac-yasnippet-candidate-face ((t (:family "DejaVu Sans Mono" :foundry "unknown" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :stipple nil :background "sandybrown" :foreground "black" :height 83))))
     (ac-yasnippet-selection-face ((t (:family "DejaVu Sans Mono" :foundry "unknown" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :stipple nil :foreground "white" :background "coral3" :height 83))))
     (bold ((t (:bold t :weight bold))))
     (bold-italic ((t (:italic t :bold t :slant italic :weight bold))))
     (border ((t (nil))))
     (buffer-menu-buffer ((t (:bold t :weight bold))))
     (button ((t (:background "#333333" :foreground "#f6f3e8"))))
     (comint-highlight-input ((t (:bold t :weight bold))))
     (comint-highlight-prompt ((t (:foreground "#e5786d"))))
     (compilation-column-number ((t (:foreground "DarkGreen"))))
     (compilation-error ((t (:foreground "Red1"))))
     (compilation-info ((t (:foreground "DeepSkyBlue4" :weight normal))))
     (compilation-line-number ((t (:foreground "DarkGreen"))))
     (compilation-mode-line-exit ((t (:bold t :foreground "ForestGreen" :weight bold))))
     (compilation-mode-line-fail ((t (:bold t :foreground "Red1" :weight bold))))
     (compilation-mode-line-run ((t (:foreground "Yellow4"))))
     (compilation-warning ((t (:foreground "Yellow4"))))
     (completions-annotations ((t (:underline t))))
     (completions-common-part ((t (nil))))
     (completions-first-difference ((t (:bold t :weight bold))))
     (cursor ((t (:background "#656565"))))
     (dired-directory ((t (:foreground "#cae682"))))
     (dired-flagged ((t (:bold t :weight bold :foreground "Pink"))))
     (dired-header ((t (:bold t :weight bold :foreground "#92a65e"))))
     (dired-ignored ((t (:foreground "grey70"))))
     (dired-mark ((t (:foreground "#e5786d"))))
     (dired-marked ((t (:background "dodgerblue3" :foreground "white"))))
     (dired-perm-write ((t (:foreground "gray50"))))
     (dired-symlink ((t (:bold t :weight bold :foreground "#8ac6f2"))))
     (dired-warning ((t (:foreground "#ccaa8f"))))
     (error ((t (:bold t :foreground "Pink" :weight bold))))
     (escape-glyph ((t (:bold t :foreground "#ddaa6f" :weight bold))))
     (file-name-shadow ((t (:foreground "grey70"))))
     (fixed-pitch ((t (:family "Monospace"))))
     (flycheck-error ((t (:underline (:style wave :color "Red1")))))
     (flycheck-error-list-checker-name ((t (:foreground "#cae682"))))
     (flycheck-error-list-column-number ((t (:foreground "#e5786d"))))
     (flycheck-error-list-error ((t (:bold t :weight bold :foreground "Pink"))))
     (flycheck-error-list-highlight ((t (:underline t :foreground "#ffffff" :background "#454545"))))
     (flycheck-error-list-id ((t (:bold t :weight bold :foreground "#92a65e"))))
     (flycheck-error-list-id-with-explainer ((t (:bold t :foreground "#92a65e" :weight bold :box (:style released-button)))))
     (flycheck-error-list-info ((t (:bold t :weight bold :foreground "Green1"))))
     (flycheck-error-list-line-number ((t (:foreground "#e5786d"))))
     (flycheck-error-list-warning ((t (:foreground "Yellow4"))))
     (flycheck-fringe-error ((t (:bold t :weight bold :foreground "Pink"))))
     (flycheck-fringe-info ((t (:bold t :weight bold :foreground "Green1"))))
     (flycheck-fringe-warning ((t (:foreground "Yellow4"))))
     (flycheck-info ((t (:underline (:style wave :color "ForestGreen")))))
     (flycheck-warning ((t (:underline (:style wave :color "DarkOrange")))))
     (flymake-errline ((t (:underline "red"))))
     (flymake-warnline ((t (:underline "magenta3"))))
     (font-lock-builtin-face ((t (:foreground "#e5786d"))))
     (font-lock-comment-delimiter-face ((t (:foreground "gray50"))))
     (font-lock-comment-face ((t (:foreground "#99968b"))))
     (font-lock-constant-face ((t (:foreground "#e5786d"))))
     (font-lock-doc-face ((t (:foreground "peru"))))
     (font-lock-function-name-face ((t (:foreground "#cae682"))))
     (font-lock-keyword-face ((t (:bold t :foreground "#8ac6f2" :weight bold))))
     (font-lock-negation-char-face ((t (nil))))
     (font-lock-preprocessor-face ((t (:foreground "gold3"))))
     (font-lock-regexp-grouping-backslash ((t (:bold t :weight bold))))
     (font-lock-regexp-grouping-construct ((t (:bold t :weight bold))))
     (font-lock-string-face ((t (:foreground "#95e454"))))
     (font-lock-type-face ((t (:bold t :foreground "#92a65e" :weight bold))))
     (font-lock-variable-name-face ((t (:foreground "#cae682"))))
     (font-lock-warning-face ((t (:foreground "#ccaa8f"))))
     (fringe ((t (:background "#303030"))))
     (glyphless-char ((t (:height 0.6))))
     (header-line ((t (:background "#303030" :foreground "#e7f6da"))))
     (helm-action ((t (:underline t))))
     (helm-candidate-number ((t (:background "Yellow" :foreground "black"))))
     (helm-candidate-number-suspended ((t (:background "black" :foreground "Yellow"))))
     (helm-header ((t (:foreground "#e7f6da" :background "#303030"))))
     (helm-header-line-left-margin ((t (:background "yellow" :foreground "black"))))
     (helm-match ((t (:foreground "gold1"))))
     (helm-prefarg ((t (:foreground "green"))))
     (helm-selection ((t (:background "ForestGreen" :distant-foreground "black"))))
     (helm-separator ((t (:foreground "red"))))
     (helm-source-header ((t (:bold t :background "#22083397778B" :foreground "white" :weight bold :height 1.3 :family "Sans Serif"))))
     (helm-visible-mark ((t (:background "green1" :foreground "black"))))
     (help-argument-name ((t (:underline t))))
     (highlight ((t (:background "#454545" :foreground "#ffffff" :underline t))))
     (isearch ((t (:background "#343434" :foreground "#857b6f"))))
     (isearch-fail ((t (:background "red4"))))
     (italic ((t (:underline t))))
     (lazy-highlight ((t (:background "#384048" :foreground "#a0a8b0"))))
     (link ((t (:foreground "#8ac6f2" :underline t))))
     (link-visited ((t (:foreground "#e5786d" :underline t))))
     (linum ((t (:foreground "grey70"))))
     (match ((t (:background "LightPink1"))))
     (menu ((t (nil))))
     (minibuffer-prompt ((t (:foreground "#e5786d"))))
     (mode-line ((t (:background "#444444" :foreground "#f6f3e8" :box (:line-width 1 :style released-button)))))
     (mode-line-buffer-id ((t (:bold t :foreground "blue4" :weight bold))))
     (mode-line-emphasis ((t (:bold t :weight bold))))
     (mode-line-highlight ((t (:box (:line-width 2 :color "red" :style released-button)))))
     (mode-line-inactive ((t (:background "#444444" :foreground "#857b6f" :box (:line-width 1 :color "gray40" :style nil)))))
     (mouse ((t (nil))))
     (next-error ((t (:foreground "#f6f3e8" :background "#444444"))))
     (nobreak-space ((t (:bold t :weight bold :foreground "#ddaa6f" :underline t))))
     (popup-face ((t (:family "DejaVu Sans Mono" :foundry "unknown" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :stipple nil :background "lightgray" :foreground "black" :height 83))))
     (popup-isearch-match ((t (:family "DejaVu Sans Mono" :foundry "unknown" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "#f6f3e8" :stipple nil :background "sky blue" :height 83))))
     (popup-menu-face ((t (:foreground "black" :background "lightgray" :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal :foundry "unknown" :family "DejaVu Sans Mono" :height 83))))
     (popup-menu-mouse-face ((t (:background "blue" :foreground "white"))))
     (popup-menu-selection-face ((t (:family "DejaVu Sans Mono" :foundry "unknown" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :stipple nil :background "steelblue" :foreground "white" :height 83))))
     (popup-menu-summary-face ((t (:foreground "dimgray" :family "DejaVu Sans Mono" :foundry "unknown" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :stipple nil :background "lightgray" :height 83))))
     (popup-scroll-bar-background-face ((t (:background "gray"))))
     (popup-scroll-bar-foreground-face ((t (:background "black"))))
     (popup-summary-face ((t (:background "lightgray" :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal :foundry "unknown" :family "DejaVu Sans Mono" :foreground "dimgray" :height 83))))
     (popup-tip-face ((t (:background "khaki1" :foreground "black"))))
     (query-replace ((t (:foreground "#857b6f" :background "#343434"))))
     (region ((t (:background "#444444" :foreground "#f6f3e8"))))
     (scroll-bar ((t (nil))))
     (secondary-selection ((t (:background "#333366" :foreground "#f6f3e8"))))
     (shadow ((t (:foreground "grey70"))))
     (show-paren-match ((t (:background "dodgerblue1" :foreground "white"))))
     (show-paren-mismatch ((t (:background "red1" :foreground "white"))))
     (sp-pair-overlay-face ((t (:underline t :foreground "#ffffff" :background "#454545"))))
     (sp-show-pair-enclosing ((t (:underline t :foreground "#ffffff" :background "#454545"))))
     (sp-show-pair-match-face ((t (:foreground "white" :background "dodgerblue1"))))
     (sp-show-pair-mismatch-face ((t (:foreground "white" :background "red1"))))
     (sp-wrap-overlay-closing-pair ((t (:underline t :background "#454545" :foreground "red"))))
     (sp-wrap-overlay-face ((t (:background "#454545" :foreground "#ffffff" :underline t))))
     (sp-wrap-overlay-opening-pair ((t (:underline t :background "#454545" :foreground "green"))))
     (sp-wrap-tag-overlay-face ((t (:background "#454545" :foreground "#ffffff" :underline t))))
     (success ((t (:bold t :foreground "Green1" :weight bold))))
     (term ((t (:family "DejaVu Sans Mono" :foundry "unknown" :width normal :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "#f6f3e8" :background "#242424" :stipple nil :height 83))))
     (term-bold ((t (:bold t :weight bold))))
     (term-color-black ((t (:background "black" :foreground "black"))))
     (term-color-blue ((t (:background "blue2" :foreground "blue2"))))
     (term-color-cyan ((t (:background "cyan3" :foreground "cyan3"))))
     (term-color-green ((t (:background "green3" :foreground "green3"))))
     (term-color-magenta ((t (:background "magenta3" :foreground "magenta3"))))
     (term-color-red ((t (:background "red3" :foreground "red3"))))
     (term-color-white ((t (:background "white" :foreground "white"))))
     (term-color-yellow ((t (:background "yellow3" :foreground "yellow3"))))
     (term-underline ((t (:underline t))))
     (tool-bar ((t (:background "grey75" :foreground "black" :box (:line-width 1 :style released-button)))))
     (tooltip ((t (:family "Sans Serif" :background "lightyellow" :foreground "black"))))
     (trailing-whitespace ((t (:background "red1"))))
     (tty-menu-disabled-face ((t (:background "blue" :foreground "lightgray"))))
     (tty-menu-enabled-face ((t (:bold t :background "blue" :foreground "yellow" :weight bold))))
     (tty-menu-selected-face ((t (:background "red"))))
     (underline ((t (:underline t))))
     (variable-pitch ((t (:family "Sans Serif"))))
     (vertical-border ((t (nil))))
     (warning ((t (:foreground "Yellow4"))))
	 (hl-line ((t (:background "gray12"))))
     (widget-button ((t (:bold t :weight bold))))
     (widget-button-pressed ((t (:foreground "red1"))))
     (widget-documentation ((t (:foreground "lime green"))))
     (widget-field ((t (:background "dim gray"))))
     (widget-inactive ((t (:foreground "grey70"))))
     (widget-single-line-field ((t (:background "dim gray"))))
     (window-divider ((t (:foreground "gray60"))))
     (window-divider-first-pixel ((t (:foreground "gray80"))))
     (window-divider-last-pixel ((t (:foreground "gray40"))))
     (yas--field-debug-face ((t (nil))))
     (yas-field-highlight-face ((t (:foreground "#f6f3e8" :background "#444444")))))))
(add-to-list 'color-themes '(color-theme-califerno-dark  "califerno-dark" "Marcello Pucci califerno@gmail.com"))
