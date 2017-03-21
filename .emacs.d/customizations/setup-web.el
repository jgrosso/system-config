(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(add-hook 'web-mode-hook #'prettify-fp-symbols)

(add-to-list 'auto-mode-alist '("\\.html.erb?$" . web-mode))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

(require 'flycheck)
(flycheck-add-mode 'javascript-eslint 'web-mode)

(setq web-mode-auto-pairing t)
(setq web-mode-enable-css-colorization t)

(setq web-mode-attr-indent-offset t)
(add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
(add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
(add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
(add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))

(fset 'commonjs-to-import
      (lambda (&optional arg)
        "Convert CommonJS require to ES6 import. `const whatever = require('../whatever'); => import whatever from '../whatever';"
        (interactive "p")
        (kmacro-exec-ring-item
         (quote ([M-S-right backspace 105 109 112 111 114 116 19 61 return backspace 102 114 111 109 19 39 return left backspace backspace backspace backspace backspace backspace backspace backspace 19 41 return backspace] 0 "%d"))
         arg)))
(global-set-key (kbd "C-c c") 'commonjs-to-import)
