;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Start iBuffer
;;
;; Friday, 15. May 2015
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(message "Loading 04-my-ibuffer")

(require 'ibuffer)

(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-switch-to-saved-filter-groups "default")))

(setq ibuffer-saved-filter-groups
	  (quote (("default"
			   ("Remote ssh" ;; remote filesystem via tramp
				(or
				 (filename . "^/ssh")
				 (name . "^\\*tramp")))
			   ("Programming" ;; prog stuff not already in MyProjectX
				(or
				 (mode . c-mode)
				 (mode . emacs-lisp-mode)
				 (mode . ruby-mode)
				 (mode . java-mode)         
				 (mode . lisp-mode)))
			   ("Emacs"
				(or (name . "^\\*scratch\\*$") (name . "^\\*Messages\\*$")))
			   ("Terminal"
				(mode . Term-mode))
			   ("Mail"
				(or  ;; mail-related buffers
				 (mode . message-mode)
				 (mode . mail-mode)
				 ;; etc.; all your mail related modes
				 ))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; End iBuffer
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(message "Loaded 04-my-ibuffer")
