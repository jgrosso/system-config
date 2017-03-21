(add-hook 'write-file-hooks
	  (lambda ()
	    (delete-trailing-whitespace)))
