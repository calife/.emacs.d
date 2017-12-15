(require 'fakecygpty)
(fakecygpty-activate)

;;; https://www.emacswiki.org/emacs/SshWithNTEmacs

(defun ssh (hostname &optional flags)
  "Start an SSH session in a shell window."
  (interactive "MSSH to host: ")
  (let ((buf (concat "*SSH:" hostname "*")))
	(if (and (get-buffer buf) (get-buffer-process buf))
		(switch-to-buffer-other-window buf)
	  (async-shell-command (concat "fakecygpty ssh " flags (when flags " ") hostname) buf))))

(defun sshx (hostname)
  "Start an SSH session with X11 forwarding in a shell window."
  (interactive "MSSH to host (X11): ")
  (ssh hostname "-X"))

(eval-after-load "tramp"
  '(progn
	 (add-to-list 'tramp-methods
				  (mapcar
				   (lambda (x)
					 (cond
					  ((equal x "sshx") "cygssh")
					  ((eq (car x) 'tramp-login-program) (list 'tramp-login-program "fakecygpty ssh"))
					  (t x)))
				   (assoc "sshx" tramp-methods)))
	 (setq tramp-default-method "cygssh")))
