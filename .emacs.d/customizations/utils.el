(defun convert-string-to-regexp (string)
  "Convert STRING to regexp (i.e. escape all characters)."
  (replace-regexp-in-string "\\." "\\\\." string))

(defun delete-regexp-in-string (regexp string)
  "Delete REGEXP from STRING."
  (replace-regexp-in-string regexp "" string))
