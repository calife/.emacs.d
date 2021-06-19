
(message "Loading 06-my-projectile")

;; To enable pojectile management create an empty .projectile file under project directory
(require 'projectile)
;; (projectile-mode)

(projectile-global-mode)

(setq projectile-indexing-method 'native)

(setq projectile-enable-caching t)

(define-key projectile-mode-map (kbd "C-S-n") 'projectile-find-file)
(define-key projectile-mode-map (kbd "C-S-f") 'projectile-grep)

;; C-p p C-h  ; to show keybinding

;; (setq neo-smart-open t)
;; (setq projectile-switch-project-action 'neotree-projectile-action)

(setq projectile-switch-project-action 'project-explorer-open) 
(global-set-key [f8] 'project-explorer-open)

(message "Loaded 06-my-projectile")
