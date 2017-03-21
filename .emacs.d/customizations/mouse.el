(setq mouse-wheel-progressive-speed nil)

(defun set-scroll-speed (speed)
  "Set scroll speed"
  (setq mouse-wheel-scroll-amount `(,speed ((shift . ,speed) ((control) . nil)))))

(defun set-trackpad-scroll ()
  "Apply trackpad scroll speed defaults"
  (interactive)
  (set-scroll-speed 3))

(defun set-mouse-scroll ()
  "Apply mouse scroll speed defaults"
  (interactive)
  (set-scroll-speed 5))
(set-mouse-scroll)
