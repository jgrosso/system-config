(defun ns-get-pasteboard ()
  "Fix weird macOS kill error"
  (condition-case nil
      (ns-get-selection-internal 'CLIPBOARD)
    (quit nil)))

(setq mouse-drag-copy-region nil)
(fset 'evil-visual-update-x-selection 'ignore)

(setq save-interprogram-paste-before-kill t)