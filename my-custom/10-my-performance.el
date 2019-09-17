;;
;; Start Windows performance tweaks (it really works!!!)
;;

(setq *win32* (eq system-type 'windows-nt) )

(if *win32*
	(progn
	  (message "Running on Windows")

	  (when (boundp 'w32-pipe-read-delay)
		(setq w32-pipe-read-delay 0))
	  ;; Set the buffer size to 64K on Windows (from the original 4K)
	  (when (boundp 'w32-pipe-buffer-size)
		(setq irony-server-w32-pipe-buffer-size (* 64 1024)))
	  ))

;; End performance tuning
