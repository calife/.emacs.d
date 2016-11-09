(deftheme eclipse
  "Created 2016-11-09.")

(custom-theme-set-variables
 'eclipse
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"]))

(custom-theme-set-faces
 'eclipse
 '(cursor ((((class color) (min-colors 88) (background light)) (:background "#000000"))))
 '(shadow ((((class color) (min-colors 88) (background light)) (:foreground "grey50"))))
 '(success ((((class color) (min-colors 88) (background light)) (:foreground "#FF0000"))))
 '(error ((((class color) (min-colors 88) (background light)) (:foreground "#FF0000" :weight bold))))
 '(warning ((((class color) (min-colors 88) (background light)) (:foreground "DarkOrange" :weight bold))))
 '(compilation-warning ((((class color) (min-colors 88) (background light)) (:underline t :inherit warning))))
 '(compilation-error ((((class color) (min-colors 88) (background light)) (:underline t :inherit error))))
 '(highlight ((((class color) (min-colors 88) (background light)) (:background "darkseagreen2"))))
 '(fringe ((((class color) (min-colors 88) (background light)) (:background "#ffffff"))))
 '(region ((t (:background "light blue" :foreground "#ffffff"))))
 '(secondary-selection ((((class color) (min-colors 88) (background light)) (:background "#333366" :foreground "#f6f3e8"))))
 '(term ((((class color) (min-colors 88) (background light)) nil)))
 '(font-lock-builtin-face ((((class color) (min-colors 88) (background light)) (:foreground "#7F0055" :bold t))))
 '(font-lock-comment-face ((((class color) (min-colors 88) (background light)) (:foreground "#3F7F5F" :slant normal))))
 '(font-lock-comment-delimiter-face ((((class color) (min-colors 88) (background light)) (:foreground "#3F7F5F" :slant normal))))
 '(font-lock-constant-face ((((class color) (min-colors 88) (background light)) (:foreground "#110099"))))
 '(font-lock-doc-face ((((class color) (min-colors 88) (background light)) (:foreground "#2A00FF"))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background light)) (:foreground "#000000" :bold t))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background light)) (:foreground "#7F0055" :weight bold))))
 '(font-lock-preprocessor-face ((((class color) (min-colors 88) (background light)) (:foreground "#7F0055" :bold t))))
 '(font-lock-regexp-grouping-backslash ((((class color) (min-colors 88) (background light)) (:foreground "#7F0055"))))
 '(font-lock-regexp-grouping-construct ((((class color) (min-colors 88) (background light)) (:foreground "#7F0055"))))
 '(font-lock-string-face ((((class color) (min-colors 88) (background light)) (:foreground "#2A00FF"))))
 '(font-lock-type-face ((((class color) (min-colors 88) (background light)) (:foreground "#000000" :underline t :slant italic))))
 '(font-lock-variable-name-face ((((class color) (min-colors 88) (background light)) (:foreground "#000000"))))
 '(font-lock-warning-face ((((class color) (min-colors 88) (background light)) (:foreground "#FF0000"))))
 '(mode-line ((t (:background "light blue" :foreground "black" :box nil))))
 '(mode-line-inactive ((((class color) (min-colors 88) (background light)) (:foreground "grey20" :background "grey90" :box nil))))
 '(minibuffer-prompt ((((class color) (min-colors 88) (background light)) (:foreground "medium blue"))))
 '(mode-line-buffer-id ((((class color) (min-colors 88) (background light)) nil)))
 '(show-paren-match ((((class color) (min-colors 88) (background light)) (:background "turquoise"))))
 '(isearch ((((class color) (min-colors 88) (background light)) (:background "magenta3" :foreground "lightskyblue1"))))
 '(link ((((class color) (min-colors 88) (background light)) (:foreground "RoyalBlue3" :underline t))))
 '(default ((((class color) (min-colors 88) (background light)) (:foreground "#000000" :background "#ffffff")))))

(provide-theme 'eclipse)
