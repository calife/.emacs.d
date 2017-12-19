;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start iBuffer
;;
;; Friday, 15. May 2015
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ibuffer)

(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-switch-to-saved-filter-groups "default")))

(setq ibuffer-saved-filter-groups
	  (quote (("default"
			("Remote ssh" ;; remote filesystem via tramp + fakecygssh
			 (or
			  (filename . "^/cygssh")
			  (name . "^\\*tramp")))
			("Programming" ;; prog stuff not already in MyProjectX
              (or
                (mode . c-mode)
                (mode . emacs-lisp-mode)
				(mode . ruby-mode)
                (mode . lisp-mode)))
			("Home"
              (filename . "/home/mpucci"))
			("Emacs"
			 (or (name . "^\\*scratch\\*$") (name . "^\\*Messages\\*$")))
            ("Mail"
              (or  ;; mail-related buffers
               (mode . message-mode)
               (mode . mail-mode)
               ;; etc.; all your mail related modes
               ))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End iBuffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
