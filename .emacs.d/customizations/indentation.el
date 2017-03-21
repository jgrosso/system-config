(setq-default indent-tabs-mode nil)
(defun die-tabs ()
  "Use two spaces for tabs"
  (interactive)
  (set-variable 'tab-width 2)
  (mark-whole-buffer)
  (untabify (region-beginning) (region-end))
  (keyboard-quit))
