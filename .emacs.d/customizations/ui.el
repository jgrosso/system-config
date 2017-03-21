(menu-bar-mode -1)

(global-linum-mode)
(setq column-number-mode t)

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(setq apropos-do-all t)

(blink-cursor-mode 0)

(show-paren-mode 1)

(tool-bar-mode -1)

(setq-default frame-title-format "%b (%f)")

(global-set-key (kbd "s-t") '(lambda () (interactive)))

(setq ring-bell-function 'ignore)
