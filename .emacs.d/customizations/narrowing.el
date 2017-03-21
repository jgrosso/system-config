;; IDO
(require 'flx-ido)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point nil)
(setq ido-auto-merge-work-directories-length -1)
(setq ido-use-virtual-buffers t)

;; Smex
(require 'smex)
(setq smex-save-file (concat user-emacs-directory ".smex-items"))

(defun use-ido ()
  (interactive)
  (ido-mode t)
  (ido-ubiquitous-mode 1)
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex))


;; Helm
(require 'helm-config)

(defun use-helm ()
  (interactive)
  (helm-mode 1)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files))


;; Ivy
(require 'ivy)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d\%d) ")

(defun use-ivy ()
  (interactive)
  (ivy-mode 1)
  (global-set-key (kbd "C-s") 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file))

(use-ido)
