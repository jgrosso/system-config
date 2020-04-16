;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(;; auto-completion
     coq
     csv
     dash
     emacs-lisp
     git
     (haskell :variables haskell-completion-backend 'dante)
     helm
     idris
     latex
     lsp
     markdown
     mu4e
     multiple-cursors
     (org :variables org-enable-github-support t org-enable-reveal-js-support t)
     osx
     pdf
     prolog
     purescript
     rust
     (shell :variables shell-default-shell 'eshell)
     spotify
     (syntax-checking :variables syntax-checking-enable-tooltips nil)
     themes-megapack
     theming
     treemacs
     (unicode-fonts :variables unicode-fonts-force-multi-color-on-mac t)
     vimscript
     yaml
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(ag eterm-256color org-fragtog scroll-restore w3m)

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; https://github.com/syl20bnr/spacemacs/issues/8853#issuecomment-302706114
  (setq evil-want-abbrev-expand-on-insert-exit nil)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun setup-temp-file-creation ()
  (setq create-lockfiles nil)
  ;; https://www.emacswiki.org/emacs/AutoSave
  (setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))
  )

(defun setup-csharp ()
  (add-hook 'csharp-mode-hook 'flycheck-mode)
  )

(defun setup-eshell ()
  (add-hook 'eshell-mode-hook (lambda () (setenv "TERM" "xterm-color")))
  )

(defun setup-haskell ()
  (require 'ghcid "~/.emacs.d/private/local/ghcid.el")

  (setq haskell-font-lock-symbols t)
  (setq haskell-tags-on-save t)

  ;; https://github.com/cydparser/demo-emacs-haskell/blob/master/emacs.d/init.el
  (setq haskell-compile-cabal-build-alt-command "cd %s && stack clean && stack build --ghc-options -ferror-spans")
  (setq haskell-compile-cabal-build-command "cd %s && stack build --ghc-options -ferror-spans")
  (setq haskell-compile-command "stack ghc -- -Wall -ferror-spans -fforce-recomp -c %s")

  (add-hook 'haskell-mode-hook 'hindent-mode)
  (setq hindent-reformat-buffer-on-save t)

  (spacemacs/set-leader-keys-for-major-mode 'haskell-mode "gcd" 'haskell-go-to-type-class-definition)
  (spacemacs/set-leader-keys-for-major-mode 'haskell-mode "gf" 'haskell-go-to-function-definition)
  (spacemacs/set-leader-keys-for-major-mode 'haskell-mode "gci" 'haskell-go-to-type-class-instance)
  (spacemacs/set-leader-keys-for-major-mode 'haskell-mode "gt" 'haskell-go-to-type-definition)

  (add-hook 'haskell-mode-hook (lambda ()
                                 (smartparens-mode -1)))
  )

(defun setup-mu4e ()
  ;; https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Bemail/mu4e
  (setq mu4e-enable-notifications t)
  (with-eval-after-load 'mu4e-alert
    (mu4e-alert-set-default-style 'notifier))

  ;; http://ict4g.net/adolfo/notes/2014/12/27/emacs-imap.html
  (add-to-list 'load-path (expand-file-name "/usr/local/Cellar/mu/1.0/share/emacs/site-lisp/mu/mu4e"))
  (setq exec-path (cons "/usr/local/bin" exec-path))
  (require 'mu4e)

  (setq mu4e-maildir "~/Maildir")
  (setq mu4e-get-mail-command "/usr/local/bin/mbsync -a")
  (setq mu4e-html2text-command "/usr/local/bin/w3m -T text/html")

  (add-to-list 'mu4e-bookmarks
               '("size:5M..500M" "Big messages" ?b))

  (setq mu4e-drafts-folder "/gmail/drafts")
  (setq mu4e-sent-folder "/gmail/sent")
  (setq mu4e-trash-folder "/gmail/trash")

  (setq message-send-mail-function 'message-send-mail-with-sendmail)
  (setq sendmail-program "/usr/local/bin/msmtp")
  (setq message-sendmail-extra-arguments '("--read-envelope-from"))
  (setq message-sendmail-f-is-evil 't)
  )

;; See https://alternativebit.fr/posts/haskell/ag.
(defun haskell-go-to-function-definition (function-name)
  (interactive "sFunction name: ")
  (helm-project-search-for-regexp (concat "\\b" function-name "\\b\\s*::"))
  )

;; See https://alternativebit.fr/posts/haskell/ag.
(defun haskell-go-to-type-definition (type-name)
  (interactive "sType name: ")
  (helm-project-search-for-regexp (concat "(data|newtype|type)\\s+\\b" type-name "\\b"))
  )

;; See https://alternativebit.fr/posts/haskell/ag.
(defun haskell-go-to-type-class-definition (type-class-name)
  (interactive "sType class name: ")
  (helm-project-search-for-regexp (concat "class\\s+\\b" type-class-name "\\b"))
  )

(defun haskell-go-to-type-class-instance (instance-name)
  (interactive "sInstance name: ")
  (helm-project-search-for-regexp (concat "instance\\s+\\b" instance-name "\\b"))
  )

;; See https://alternativebit.fr/posts/haskell/ag.
(defun haskell-maybe-go-to-data-constructor-definition (data-constructor-name)
  "Search the current project for the specified data constructor. This is not guaranteed to work in all cases (e.g. when an ADT is defined inline)."
  (interactive "sData constructor name: ")
  (helm-project-search-for-regexp (concat "^\\s+(\\||=)\\s+\\b" data-constructor-name "\\b"))
  )

(defun org-toggle-all-latex-fragments ()
  (interactive)
  (org-toggle-latex-fragment '(16))
  )

;; https://orgmode.org/manual/Breaking-down-tasks.html
(defun org-auto-close-parent-todos (num-children-done num-children-not-done)
  "Switch entry to DONE when all subentries are done, but to TODO otherwise."
  (let (org-log-done org-log-states) ;; Disable logging
    (org-todo (if (= num-children-not-done 0) "DONE" "TODO")))
  )

(setq org-wiki-location (concat (getenv "HOME") "/org-wiki/"))

(setq org-wiki-page-extension ".org")

(setq org-wiki-file-path-word-separator "-")

;; Inverse of `org-wiki-file-path-to-page-name'.
(defun org-wiki-page-name-to-file-path (page-name)
  (concat org-wiki-location
          (replace-regexp-in-string " " org-wiki-file-path-word-separator page-name)
          org-wiki-page-extension)
  )

;; Inverse of `org-wiki-page-name-to-file-path'.
(defun org-wiki-file-path-to-page-name (file-path)
  (replace-regexp-in-string org-wiki-file-path-word-separator
                            " "
                            (string-remove-suffix org-wiki-page-extension file-path))
  )

;; Inverse of `org-wiki-title-to-page-name'
(defun org-wiki-page-name-to-title (page-name)
  (concat "* " page-name)
  )

;; Inverse of `org-wiki-page-name-to-title'
(defun org-wiki-title-to-page-name (page-name)
  (string-remove-prefix "* " page-name)
  )

(defun org-wiki-page-p (file-path)
  (string-suffix-p org-wiki-page-extension file-path)
  )

(defun org-wiki-files ()
  (seq-filter #'org-wiki-page-p (directory-files org-wiki-location))
  )

(defun org-wiki-page-names ()
  (mapcar #'org-wiki-file-path-to-page-name (org-wiki-files))
  )

(defmacro org-wiki-interactive-page-name ()
  '(interactive
    (list
     (completing-read "Page name: " (org-wiki-page-names))))
  )

(defun org-wiki-insert-link (page-name)
  (org-wiki-interactive-page-name)
  (org-insert-link nil (org-wiki-page-name-to-file-path page-name) page-name)
  )

(defun org-wiki-open-page (page-name)
  (org-wiki-interactive-page-name)
  (let ((file-path (org-wiki-page-name-to-file-path page-name)))
    (unless (file-exists-p file-path)
      (with-temp-file file-path
        (insert (org-wiki-page-name-to-title page-name))))
    (find-file file-path))
  )

(defun org-wiki-verify-correct-title ()
  (save-excursion
    (goto-char (point-min))
    (let* ((file-path (string-remove-prefix org-wiki-location buffer-file-name))
           (page-name (org-wiki-file-path-to-page-name file-path))
           (actual-title-line (buffer-substring-no-properties
                               (line-beginning-position)
                               (line-end-position)))
           (expected-title-line (org-wiki-page-name-to-title page-name)))
      (unless (string= actual-title-line expected-title-line)
        (error "In-page title does not match page name!"))))
  )

(defun org-wiki-rename-current-page (new-page-name)
  (org-wiki-interactive-page-name)
  (org-wiki-verify-correct-title)
  (let ((new-file-path (org-wiki-page-name-to-file-path new-page-name)))
    (save-excursion
      (goto-char (point-min))
      (kill-line)
      (insert (org-wiki-page-name-to-title new-page-name)))
    (rename-file (buffer-file-name) new-file-path)
    (set-visited-file-name new-file-path t t)
    (save-buffer))
  )

(defun setup-org-wiki ()
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wl" 'org-wiki-insert-link)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "wr" 'org-wiki-rename-current-page)
  (global-set-key (kbd "H-o") #'org-wiki-open-page)

  (add-hook 'after-save-hook
            (lambda ()
              (let ((file-path (buffer-file-name)))
                (when (string-prefix-p org-wiki-location file-path)
                  (shell-command (concat "git add " file-path " && "
                                         "git commit --no-gpg-sign -m 'org-wiki change: " (file-name-nondirectory file-path) "'"))))))
  )

(defun setup-org ()
  ;; https://github.com/syl20bnr/spacemacs/issues/10944
  (require 'ox)

  (plist-put org-format-latex-options :scale 1.5)
  (setq org-startup-with-latex-preview t)
  (add-hook 'org-mode-hook
            (lambda ()
              (define-key org-mode-map (kbd "H-l") 'org-toggle-all-latex-fragments)
              (local-set-key (kbd "RET") 'newline-and-indent)
              (local-set-key (kbd "H-f")
                             (lambda ()
                               (interactive)
                               (fill-region (point-min) (point-max))
                               (evil-indent (point-min) (point-max))))))
  (add-hook 'org-after-todo-statistics-hook 'org-auto-close-parent-todos)
  (setup-org-wiki)
  )

(defun setup-helm ()
  ;; https://github.com/syl20bnr/spacemacs/issues/13100
  (setq helm-completion-style 'emacs)
  (setq completion-styles '(helm-flex)))

(defun setup-purescript ()
  (add-hook 'purescript-mode-hook (lambda ()
                                    (turn-on-purescript-unicode-input-method)
                                    (setq psc-ide-add-import-on-completion t)
                                    (setq psc-ide-rebuild-on-save t)))
  )

(defun setup-rust ()
  (add-hook 'rust-mode-hook (lambda ()
                              (setq rust-format-on-save t)))
  )

(defun set-window-dimension (window orientation n)
  (let* ((current-value (if (eq orientation 'horizontal)
                            (window-body-width window)
                          (window-body-height window)))
         (delta (- n current-value)))
    (window-resize window delta (eq orientation 'horizontal)))
  )

(defun setup-theme ()
  (setq theming-modifications
        '((flatland (markdown-header-face-1 :inherit markdown-header-face :height 1.5)
                    (markdown-header-face-2 :inherit markdown-header-face :height 1.3)
                    (markdown-header-face-3 :inherit markdown-header-face :height 1.1)
                    (org-level-1 :inherit org-level-1 :height 1.5)
                    (org-level-2 :inherit org-level-2 :height 1.4)
                    (org-level-3 :inherit org-level-3 :height 1.3)
                    (org-level-4 :inherit org-level-4 :height 1.1)
                    (org-level-5 :inherit org-level-5 :height 1.1))))
  (spacemacs/update-theme)
  )

;; Adapted from https://emacs.stackexchange.com/a/16877/13471.
(defun get-buffers-with-major-mode (needle)
  "Get a list of buffers with the specified major mode (or a descendant) enabled."
  (require 'seq)

  (seq-filter (lambda (buffer)
                (with-current-buffer buffer
                  (derived-mode-p needle)))
              (buffer-list))
  )

(defun setup-word-wrap ()
  (global-visual-line-mode t)
  (evil-define-minor-mode-key 'motion 'visual-line-mode "j" 'evil-next-visual-line)
  (evil-define-minor-mode-key 'motion 'visual-line-mode "k" 'evil-previous-visual-line)
  )

(setq current-retry-timer nil)
(defun retry-until-abort (fn)
  (setq current-retry-timer
        (run-at-time
         0
         0.05
         #'(lambda (fn)
             (funcall fn (lambda () (cancel-timer current-retry-timer))))
         fn))
  )

(defun setup-autocompletion ()
  (setq company-tooltip-minimum 4)
  )

(defun setup-c ()
  (add-hook 'c-mode-hook (lambda ()
                           (setq c-default-style "k&r")
                           (setq c-basic-offset 4)
                           (c-set-offset 'arglist-close 0)
                           (setq flycheck-clang-language-standard "gnu99")))
  )

(defun setup-latex ()
  ;; https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Blang/latex
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  )

(defun setup-layers ()
  (setup-autocompletion)
  (setup-c)
  (setup-csharp)
  (setup-eshell)
  (setup-haskell)
  (setup-helm)
  (setup-latex)
  (setup-mu4e)
  (setup-org)
  (setup-purescript)
  (setup-rust)
  (setup-theme)
  )

(defun setup-horizontal-scrolling ()
  (global-set-key [wheel-left] 'scroll-right)
  (global-set-key [wheel-right] 'scroll-left)
  )

(defun scroll-buffer-down ()
  (interactive)
  (scroll-down-command 1)
  )

(defun scroll-buffer-up ()
  (interactive)
  (scroll-up-command 1)
  )

(defun setup-scrolling ()
  (setq mouse-wheel-progressive-speed nil)
  ;; (setup-horizontal-scrolling)
  (scroll-bar-mode)

  (setq scroll-restore-handle-cursor t)
  (setq scroll-restore-cursor-type nil)
  (setq scroll-restore-jump-back t)
  (global-set-key (kbd "H-r") (lambda () (interactive) (scroll-restore-mode) (scroll-restore-mode)))
  (scroll-restore-mode 1)
  )

(defun setup-titlebar ()
  ;; https://github.com/d12frosted/homebrew-emacs-plus#important
  (add-to-list 'default-frame-alist
               '(ns-transparent-titlebar . t))
  (add-to-list 'default-frame-alist
               '(ns-appearance . dark))
  )

(defun helm-project-search-for-regexp (pattern)
  "Search the current project for the specific regular expression."
  (interactive "sPattern: ")
  (defun set-marked-input (dummy-escape)
    pattern)
  (advice-add 'helm-ag--marked-input :override #'set-marked-input)
  (spacemacs/helm-project-do-rg-region-or-symbol)
  (advice-remove 'helm-ag--marked-input #'set-marked-input)
  )

(defun helm-project-do-rg-with-regexp ()
  "Search in current project with `rg'."
  (interactive)
  (defun use-literal-regexp ()
    (setq helm-ag--command-features (remove 're2 helm-ag--command-features)))
  (advice-add 'helm-ag--set-command-features :after #'use-literal-regexp)
  (spacemacs/helm-project-do-rg)
  (advice-remove 'helm-ag--set-command-features #'use-literal-regexp)
  )

(defun setup-evil ()
  (setq evil-want-Y-yank-to-eol nil)
  (setq evil-escape-key-sequence "jk")
  (evil-leader/set-key "/" 'helm-project-do-rg-with-regexp)
  )

(defun setup-shell ()
  (global-set-key (kbd "H-<escape>") #'spacemacs/shell-pop-ansi-term)
  (global-set-key (kbd "H-k") (lambda ()
                                (interactive)
                                (when (eq major-mode 'term-mode)
                                  (spacemacs/comint-clear-buffer))))
  (add-hook 'term-mode-hook #'eterm-256color-mode)
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (setup-evil)
  (setup-temp-file-creation)
  (global-subword-mode)
  (setup-word-wrap)
  (setq vc-follow-symlinks t)
  (setup-scrolling)
  (setup-shell)
  (setup-titlebar)
  (setup-layers)
  (spacemacs/toggle-mode-line-battery-on)
  (global-set-key (kbd "H-r") 'font-lock-fontify-buffer)

  (add-hook
   'compilation-mode-hook
   (lambda ()
     (retry-until-abort
      (lambda (abort-fn)
        (dolist (compilation-buffer (get-buffers-with-major-mode 'compilation-mode))
          (let ((compilation-window (get-buffer-window compilation-buffer)))
            ;; Try setting either the height or the width (if more than two windows are visible, this may break down).
            (ignore-errors
              (set-window-dimension
               compilation-window
               'horizontal
               (round (* 0.25 (frame-width)))))
            (ignore-errors
              (set-window-dimension
               compilation-window
               'vertical
               (round (* 0.3 (frame-height)))))
            (funcall abort-fn)))))))

  (add-hook 'text-mode-hook (lambda () (setq word-wrap t)))
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fill-column 100)
 '(lsp-ui-sideline-show-diagnostics nil)
 '(lsp-ui-sideline-show-hover nil)
 '(org-startup-truncated nil)
 '(package-selected-packages
   (quote
    (org-fragtog scroll-restore org-ql org-super-agenda map utop tuareg caml ocp-indent helm-gtags ggtags flycheck-ocaml merlin dune counsel-gtags counsel swiper ivy dante elisp-format web-completion-data company-reftex ac-php-core xcscope company-ghci company-math math-symbol-lists attrap helm-org chocolate-theme ediprolog srefactor idris-mode prop-menu selectric-mode lsp-ui lsp-treemacs helm-lsp cquery company-lsp ccls company-ghc ghc lcr tide typescript-mode flyspell-correct-helm flyspell-correct auto-dictionary zenburn-theme zen-and-art-theme yasnippet-snippets yaml-mode xterm-color ws-butler writeroom-mode winum white-sand-theme which-key web-mode web-beautify w3m volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unicode-fonts underwater-theme ujelly-theme typit twilight-theme twilight-bright-theme twilight-anti-bright-theme treemacs-projectile treemacs-evil toxi-theme toml-mode toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit symon sunny-day-theme sudoku sublime-themes subatomic256-theme subatomic-theme string-inflection spotify spaceline-all-the-icons spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme seeing-is-believing scss-mode sass-mode rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocop rspec-mode robe reverse-theme reveal-in-osx-finder restart-emacs rebecca-theme rbenv rainbow-delimiters railscasts-theme racer purple-haze-theme pug-mode psci psc-ide proof-general projectile-rails professional-theme prettier-js popwin planet-theme phpunit phpcbf php-extras php-auto-yasnippets phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pdf-tools password-generator paradox pacmacs ox-reveal ox-gfm overseer osx-trash osx-dictionary orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-download org-bullets org-brain open-junk-file omtose-phellack-theme omnisharp oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme nameless mustang-theme multi-term mu4e-maildirs-extension mu4e-alert move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minitest minimal-theme material-theme markdown-toc majapahit-theme magit-svn magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum livid-mode link-hint light-soap-theme launchctl kaolin-themes json-navigator json-mode js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme intero inkpot-theme indent-guide impatient-mode hungry-delete hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-xref helm-themes helm-swoop helm-spotify-plus helm-rtags helm-purpose helm-projectile helm-org-rifle helm-mu helm-mode-manager helm-make helm-hoogle helm-gitignore helm-git-grep helm-flx helm-descbinds helm-dash helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haskell-snippets gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate google-c-style golden-ratio godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md gandalf-theme fuzzy font-lock+ flycheck-rust flycheck-rtags flycheck-pos-tip flycheck-haskell flx-ido flatui-theme flatland-theme fill-column-indicator feature-mode farmhouse-theme fancy-battery eziam-theme eyebrowse expand-region exotica-theme evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav editorconfig dumb-jump drupal-mode dracula-theme dotenv-mode doom-themes doom-modeline django-theme disaster diminish dash-at-point darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cyberpunk-theme csv-mode counsel-projectile company-web company-tern company-tabnine company-statistics company-rtags company-php company-go company-coq company-cabal company-c-headers company-auctex column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized cmm-mode clues-theme clojure-snippets clojure-cheatsheet clean-aindent-mode clang-format cider-eval-sexp-fu chruby cherry-blossom-theme centered-cursor-mode cargo busybee-theme bundler bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-compile auctex-latexmk apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent ag afternoon-theme ace-link ace-jump-helm-line ac-ispell 2048-game)))
 '(safe-local-variable-values
   (quote
    ((dante-repl-command-line "stack" "ghci" "--test" "--main-is" "axel:test:axel-test")
     (dante-repl-command-line "stack" "ghci" "--test" "--main-is axel:test:axel-test")
     (dante-repl-command-line quote
                              ("stack" "ghci" "--test" "--main-is axel:test:axel-test"))
     (dante-target "axel-test")
     (typescript-backend . tide)
     (typescript-backend . lsp)
     (javascript-backend . tern)
     (javascript-backend . lsp)
     (go-backend . go-mode)
     (go-backend . lsp))))
 '(shell-pop-autocd-to-working-dir nil)
 '(yas-snippet-dirs (quote ("/Users/joshuagrosso/.emacs.d/private/snippets/"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(lsp-face-highlight-read ((t (:underline "gray29")))))
)
