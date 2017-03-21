(add-to-list 'default-frame-alist '(font . "InputMono"))


(defun set-font-size (size)
  "Set font size to SIZE."
  (interactive "nSize: ")
  (set-face-attribute 'default nil :height size))

(set-font-size 140)
