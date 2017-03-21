(defun switch-to-previous-buffer ()
  "Switch to previously open buffer."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))
(global-set-key (kbd "C-c b") 'switch-to-previous-buffer)

(defun gk/is-spec-p (file)
  "Compute whether FILE is a spec or not."
  (string-prefix-p gk/spec-folder file))
(defun gk/spec-path-to-implementation (file)
  "Convert FILE to an implementation path."
  (replace-regexp-in-string (convert-string-to-regexp gk/spec-suffix) gk/implementation-suffix file))
(defun gk/implementation-path-to-spec (file)
  "Convert FILE to a spec path."
  (replace-regexp-in-string (convert-string-to-regexp gk/implementation-suffix) gk/spec-suffix file))
(defun gk/find-matching-spec (file)
  "Compute the name of the spec matching FILE."
  (let ((spec-path (gk/implementation-path-to-spec file)))
    (replace-regexp-in-string gk/implementation-folder gk/spec-folder spec-path)))
(defun gk/find-matching-implementation (file)
  "Compute the name of the implementation matching FILE."
  (let ((implementation-path (gk/spec-path-to-implementation file)))
    (replace-regexp-in-string gk/spec-folder gk/implementation-folder implementation-path)))
(defun gk/find-matching-spec-or-implementation (file)
  "Compute the name of the spec or implementation file matching FILE."
  (let ((relative-path (substring file (length gk/prefix))))
    (message relative-path)
    (concat
     gk/prefix
     (if (gk/is-spec-p relative-path)
         (gk/find-matching-implementation relative-path)
       (gk/find-matching-spec relative-path)))))
(defun gk/open-matching-spec-or-implementation ()
  "Open the matching spec or implementation file matching the currently open file."
  (interactive)
  (find-file-other-window (gk/find-matching-spec-or-implementation (buffer-file-name (current-buffer))))
  (toggle-window-split))
(global-set-key (kbd "M-n t") 'gk/open-matching-spec-or-implementation)
