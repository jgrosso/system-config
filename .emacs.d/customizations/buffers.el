;; https://www.emacswiki.org/emacs/KillingBuffers
(defun kill-other-buffers ()
  "Kill all buffers other than the currently-focused one."
  (interactive)
  (message "Killed other buffers!")
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))
(global-set-key (kbd "C-c o k") 'kill-other-buffers)

(defun kill-all-buffers ()
  "Kill all buffers."
  (interactive)
  (message "Killed all buffers!")
  (mapc 'kill-buffer (buffer-list)))
(global-set-key (kbd "C-c k") 'kill-all-buffers)
