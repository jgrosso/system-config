(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

; http://stackoverflow.com/a/7017656/2391244
(defadvice rgrep (around rgrep-init)
  "Init grep defaults before calling rgrep non-interactively."
  ; https://stackoverflow.com/questions/10400328/wrong-number-of-arguments-called-interactively-p-1
  (when (not (called-interactively-p 'any))
    (grep-compute-defaults))
  ad-do-it)
(ad-activate 'rgrep)

(defun gk/src-grep (pattern)
  "Recursively grep for PATTERN in the GitKraken source directory."
  (interactive "sPattern: ")
  (rgrep pattern "*" (concat gk/prefix gk/implementation-folder)))
(global-set-key (kbd "C-S-f") 'gk/src-grep)

(defun gk/spec-grep (pattern)
  "Recursively grep for PATTERN in the GitKraken spec directory."
  (interactive "sPattern: ")
  (rgrep pattern "*" (concat gk/prefix gk/spec-folder)))
(global-set-key (kbd "C-M-S-f") 'gk/spec-grep)

(defun gk/find-component-usages ()
  "Find all usages of the component defined in the currently open file."
  (interactive)
  (let ((file-name (delete-regexp-in-string ".*/" (buffer-file-name (current-buffer)))))
    (gk/src-grep (concat "<" (delete-regexp-in-string (convert-string-to-regexp ".jsx") file-name)) "*.jsx")))

(defun gk/find-resource (resource)
  (interactive "sResource: ")
  (rgrep resource "*.json" (concat gk/prefix gk/resources-folder)))
