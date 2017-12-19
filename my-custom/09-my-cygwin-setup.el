;;; https://www.emacswiki.org/emacs/SshWithNTEmacs
;;
;; Download, compile and save executable ssh.exe , fakecygpty.exe, qkill.exe
;; Put in Windows path
;;
;; test with C:>fakecygpty ssh root@host
;;
;; venerdì, 15. dicembre 2017
;;
;; Error was, while accessing via ssh:
;; Pseudo-terminal will not be allocated because stdin is not a terminal.
;;   ssh_askpass: exec(/usr/sbin/ssh-askpass): No such file or directory
;;   Permission denied, please try again.
;;   ssh_askpass: exec(/usr/sbin/ssh-askpass): No such file or directory
;;   Permission denied, please try again.
;;   ssh_askpass: exec(/usr/sbin/ssh-askpass): No such file or directory
;;   Permission denied (publickey,gssapi-with-mic,password).
;;
;; Closed.
;;
;; /cygssh:root@host:/home/somewhere/
;;

(setq tramp-verbose 10)

(require 'fakecygpty)
(fakecygpty-activate)

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


; Shell setup
; http://echosa.github.io/blog/2012/06/06/improving-ansi-term/

;; kill the buffer on exit command in terminal
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

;; I don’t need ansi-term to ask me which shell to use every time I invoke it
(defvar my-term-shell "/bin/bash")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

;; Display of certain characters and control codes
(defun my-term-use-utf8 ()
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(add-hook 'term-exec-hook 'my-term-use-utf8)


(defun my-term-paste (&optional string)
 (interactive)
 (process-send-string
  (get-buffer-process (current-buffer))
  (if string string (current-kill 0))))

(defun my-term-hook ()
  (define-key term-raw-map "\C-y" 'my-term-paste))

(add-hook 'term-mode-hook 'my-term-hook)



; End shell setup
