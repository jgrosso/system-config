(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                        ("marmalade" . "https://marmalade-repo.org/packages/")
                        ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(ac-emmet
    aggressive-indent
    auto-complete
    clojure-mode
    clojure-mode-extra-font-locking
    cider
    counsel
    edit-server
    elixir-mode
    elm-mode
    emmet-mode
    exec-path-from-shell
    flx-ido
    flycheck
    fsharp-mode
    helm
    ido-ubiquitous
    ivy
    less-css-mode
    magit
    markdown-mode
    material-theme
    matlab-mode
    multiple-cursors
    paredit
    parinfer
    projectile
    psc-ide
    purescript-mode
    rainbow-delimiters
    slime
    smart-mode-line
    smart-mode-line-powerline-theme
    smex
    smooth-scrolling
    swiper
    swiper-helm
    tagedit
    web-mode
    wolfram
    zenburn-theme))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
