;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/vendor")
; Should contain:
; * apib-mode.el
; * evil/*

(add-to-list 'load-path "~/.emacs.d/customizations")

; Install packages first in a new setup
(load "packages")

; Load utils.el first so that other files can reference it
(load "utils")

(load "autocompletion")
(load "backups")
(load "buffers")
(load "clipboard")
(load "comments")
(load "editing")
(load "fonts")
(load "gitkraken")
(load "indentation")
(load "internals")
(load "minibuffer")
(load "mode-bar")
(load "mouse")
(load "narrowing")
(load "navigation")
(load "search")
(load "setup-api-blueprint")
(load "setup-clojure")
(load "setup-common-lisp")
(load "setup-edit-with-emacs")
(load "setup-evil")
(load "setup-flycheck")
(load "setup-haskell")
(load "setup-lisp")
(load "setup-prettify-symbols")
(load "setup-projectile")
(load "setup-purescript")
(load "setup-recentf")
(load "setup-saveplace")
(load "setup-sh")
(load "setup-uniquify")
(load "setup-web")
(load "setup-wolfram")
(load "shell-integration")
(load "themes")
(load "ui")
(load "whitespace")
(load "windows")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-safe-themes
   (quote
    ("84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "5cd0afd0ca01648e1fff95a7a7f8abec925bd654915153fb39ee8e72a8b56a1f" "9be1d34d961a40d94ef94d0d08a364c3d27201f3c98c9d38e36f10588469ea57" "85d609b07346d3220e7da1e0b87f66d11b2eeddad945cac775e80d2c1adb0066" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "e1498b2416922aa561076edc5c9b0ad7b34d8ff849f335c13364c8f4276904f0" "4e753673a37c71b07e3026be75dc6af3efbac5ce335f3707b7d6a110ecb636a3" "3c98d13ae2fc7aa59f05c494e8a15664ff5fe5db5256663a907272869c4130dd" "5436e5df71047d1fdd1079afa8341a442b1e26dd68b35b7d3c5ef8bd222057d1" "a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" "3e34e9bf818cf6301fcabae2005bba8e61b1caba97d95509c8da78cff5f2ec8e" "cabc32838ccceea97404f6fcb7ce791c6e38491fd19baa0fcfb336dcc5f6e23c" "1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "760ce657e710a77bcf6df51d97e51aae2ee7db1fba21bbad07aab0fa0f42f834" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" "1263771faf6967879c3ab8b577c6c31020222ac6d3bac31f331a74275385a452" "3f546f127564de59f1c42dfd65d32bd7650fa5a614cd58c2df061da052ea3ec0" "3b0a350918ee819dca209cec62d867678d7dac74f6195f5e3799aa206358a983" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" default)))
 '(fci-rule-color "#383838")
 '(flycheck-ghc-language-extensions
   (quote
    ("ExplicitForAll" "ForeignFunctionInterface" "InstanceSigs" "LambdaCase" "NamedFieldPuns" "OverloadedStrings" "RankNTypes" "ScopedTypeVariables" "TemplateHaskell" "UnicodeSyntax")))
 '(hl-sexp-background-color "#1c1f26")
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(package-selected-packages
   (quote
    (flymd fill-column-indicator wolfram-mode wolfram smart-mode-line-powerline-theme smart-mode-line multiple-cursors php-mode slime parinfer flycheck-liquidhs matlab-mode swiper-helm counsel ivy anti-zenburn-theme 2048-game helm tangotango-theme zenburn-theme ample-theme cyberpunk-theme base16-theme railscasts-reloaded-theme railscasts-theme color-theme-railscasts atom-one-dark-theme solarized-theme monokai-theme material-theme w3 less-css-mode evil-visual-mark-mode evil company-math psc-ide haskell-mode purescript-mode web-mode tagedit smooth-scrolling smex rainbow-delimiters projectile paredit markdown-mode magit ido-ubiquitous fsharp-mode flx-ido exec-path-from-shell elm-mode elixir-mode edit-server clojure-mode-extra-font-locking cider aggressive-indent ac-emmet)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(safe-local-variable-values
   (quote
    ((psc-ide-source-globs "src/**/*.purs" "bower_components/purescript-*/src/**/*.purs"))))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(wolfram-alpha-app-id "PTYW9P-UTU66T8A64" t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
