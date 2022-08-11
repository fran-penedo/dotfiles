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
   '(javascript
     yaml
     csv
     sql
     ruby
     ;; notmuch
     html
     systemd
     (debug :variables
            debug-additional-debuggers '("pdb"))
     imenu-list
     ibuffer
     ranger
     pdf
     (latex :variables
            latex-enable-folding t)
     gtags
     (python :variables
             python-formatter 'black
             python-format-on-save t
             python-shell-interpreter-args "-i --simple-prompt"
             python-sort-imports-on-save t
             python-backend 'lsp
             python-lsp-server 'pyright)
     (lsp :variables
          lsp-enable-symbol-highlighting nil
          lsp-headerline-breadcrumb-enable t)
     (haskell :variables
              haskell-completion-backend 'intero
              haskell-enable-hindent t)
     (ipython-notebook :variables ein-backend 'jupyter)
     neotree
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-tab-key-behavior 'cycle
                      auto-completion-return-key-behavior nil
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-private-snippets-directory "~/dev/templates/snippets/"
                      auto-completion-enable-help-tooltip t
                      )
     ;; better-defaults
     emacs-lisp
     git
     helm
     markdown
     multiple-cursors
     (org :variables
          org-want-todo-bindings t)
     (shell :variables
            shell-default-shell 'vterm
            shell-default-width 24
            shell-default-position 'right)
     (shell-scripts :variables
                    shell-scripts-format-on-save t
                    shell-scripts-backend nil)
     (spell-checking :variables
                     spell-checking-enable-by-default nil)
     syntax-checking
     ;; treemacs
     version-control
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages
   '(
     flycheck-mypy
     org-caldav
     (org-super-links :location (recipe
                                 :fetcher github
                                 :repo "toshism/org-super-links"))
     py-autopep8
     numpydoc
     envrc
     multi-vterm
     )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(evil-mc)

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
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

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

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

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
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

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

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("DejaVuSansMono Nerd Font"
                               :size 10.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ";"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

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
   dotspacemacs-enable-paste-transient-state t

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
   dotspacemacs-mode-line-unicode-symbols nil

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
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
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

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
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "rg" "pt" "ack" "grep")

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
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

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
  (setq
   ranger-override-dired t
   ranger-key nil
   )
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (setq-default

   ;; General settings
   fill-column 88
   scroll-margin 8
   flycheck-check-syntax-automatically '(save new-line mode-enabled)
   tramp-terminal-type "tramp"
   ;; winum-scope 'visible
   browse-url-browser-function #'eww
   evil-vsplit-window-right t
   evil-split-window-below t
   vc-follow-symlinks t
   undo-tree-auto-save-history nil

   ;; Latex settings
   TeX-PDF-from-DVI "Dvips"
   TeX-command-extra-options "--shell-escape --verbose"
   TeX-error-overview-open-after-TeX-run t
   TeX-debug-bad-boxes t
   TeX-debug-warnings t
   TeX-view-program-list '(("PDF Tools" TeX-pdf-tools-sync-view))
   TeX-view-program-selection '((output-pdf "PDF Tools"))
   TeX-master nil ; Query for master file.

   ;; Python settings
   flycheck-python-mypy-args "--follow-imports=silent"
   lsp-diagnostic-package :none
   ;; yas-inhibit-overlay-modification-protection nil
   importmagic-python-interpreter "python"
   pytest-cmd-flags ""
   ;; blacken-line-length 79

   ;; vterm settings
   vterm-min-window-width 1

   ;; org caldav settings
   org-caldav-url "https://cloud.franpenedo.com/remote.php/dav/calendars/fran"
   org-caldav-calendar-id "personal"
   org-caldav-inbox "~/net/gtd/calendar.org"
   org-caldav-files (list org-caldav-inbox)
   org-icalendar-timezone "Europe/Madrid"
   org-caldav-save-directory "~/net/gtd/"
   org-caldav-delete-calendar-entries 'always
   org-caldav-delete-org-entries 'always
   org-caldav-show-sync-results nil
   )

  ;; Window management
  (defadvice evil-window-split
      (after prompt-for-buffer-split activate)
    (lazy-helm/helm-mini))

  (defadvice evil-window-vsplit
      (after prompt-for-buffer-vsplit activate)
    (lazy-helm/helm-mini))

  ;; General keybinds
  (define-key evil-normal-state-map (kbd "M-o") 'evil-jump-backward)
  (define-key evil-normal-state-map (kbd "M-i") 'evil-jump-forward)
  (define-key evil-normal-state-map "^" 'evil-digit-argument-or-evil-beginning-of-line)
  (define-key evil-normal-state-map "0" 'evil-first-non-blank)
  (define-key evil-normal-state-map "Y" "y$")
  (define-key evil-normal-state-map "Q" 'evil-window-delete)
  (define-key evil-normal-state-map "'" 'evil-goto-mark)
  (define-key evil-insert-state-map (kbd "C-e") 'evil-append-line)
  (define-key evil-insert-state-map (kbd "C-a") 'evil-insert-line)
  (define-key evil-insert-state-map (kbd "C-d") 'delete-forward-char)
  (define-key evil-normal-state-map (kbd "C-;") 'comment-line)
  (define-key evil-visual-state-map (kbd "C-;") 'evilnc-comment-operator)
  (define-key evil-normal-state-map "R" "@@")
  (define-key evil-normal-state-map (kbd "C-n") 'neotree-toggle)
  (define-key evil-normal-state-map "zl" 'hs-hide-level)
  (define-key evil-normal-state-map "M" 'helm-projectile-switch-to-buffer)
  (defun helm-projectile-or-find ()
    (interactive)
    (if (projectile-project-root) (helm-projectile) (helm-find nil)))
  (define-key evil-normal-state-map (kbd "C-p") 'helm-projectile-or-find)
  (define-key evil-normal-state-map "f" 'evil-avy-goto-char-2)
  (define-key evil-normal-state-map "F" 'evil-avy-goto-char-in-line)
  ;; (define-key evil-normal-state-map (kbd "r") (lambda () (interactive) (evil-ex "%s/")))
  (define-key evil-normal-state-map (kbd "r") 'save-buffer)
  (define-key evil-motion-state-map (kbd "C-o") nil) ; Disable C-o so it can be bound in major modes
  (define-key evil-normal-state-map (kbd "s-h") 'evil-window-left)
  (define-key evil-normal-state-map (kbd "s-j") 'evil-window-down)
  (define-key evil-normal-state-map (kbd "s-k") 'evil-window-up)
  (define-key evil-normal-state-map (kbd "s-l") 'evil-window-right)
  (define-key evil-insert-state-map (kbd "s-h") 'evil-window-left)
  (define-key evil-insert-state-map (kbd "s-j") 'evil-window-down)
  (define-key evil-insert-state-map (kbd "s-k") 'evil-window-up)
  (define-key evil-insert-state-map (kbd "s-l") 'evil-window-right)
  (evil-define-key 'normal eww-mode-map (kbd "s") 'ace-link-eww)

  ;; Leader keybinds
  (spacemacs/set-leader-keys (kbd "wz") 'fit-window-to-buffer)
  (spacemacs/set-leader-keys (kbd "bc") 'clone-indirect-buffer-other-window)
  (spacemacs/set-leader-keys (kbd "rw") 'window-configuration-to-register)
  (spacemacs/set-leader-keys (kbd "rj") 'jump-to-register)
  (spacemacs/set-leader-keys (kbd "aa") 'multi-vterm)
  (spacemacs/set-leader-keys (kbd "as") 'eww)


  ;; Mode keybinds
  (with-eval-after-load "company"
    (define-key company-active-map (kbd "C-w") nil))

  (with-eval-after-load "python"
    (define-key python-mode-map (kbd "C-o") 'helm-gtags-select)
    (spacemacs/set-leader-keys-for-major-mode 'python-mode (kbd "tt")
      (lambda () (interactive) (pytest-one "-s "))))

  ;; (with-eval-after-load "ranger"
  (define-key ranger-mode-map (kbd "C-p") nil)
  (define-key dired-mode-map (kbd "C-p") nil)
  (define-key ranger-mode-map (kbd "C-p") 'helm-projectile-or-find)
  (define-key dired-mode-map (kbd "C-p") 'helm-projectile-or-find)

  ;; lsp config
  (with-eval-after-load 'lsp-mode
    (setq lsp-ui-doc-show-with-cursor nil
          lsp-ui-doc-show-with-mouse nil
          lsp-ui-peek-always-show t)

    (lsp-register-client
     (make-lsp-client :new-connection (lsp-tramp-connection "pyright")
                      :major-modes '(python-mode)
                      :remote? t
                      :server-id 'pyright-remote))

    (advice-add 'lsp :before (lambda (&rest _args) (eval '(setf (lsp-session-server-id->folders (lsp-session)) (ht))))))

  ;; recentf config
  (with-eval-after-load "recentf"
    (add-to-list 'recentf-exclude "/tmp/"))

  ;; Latex config
  (add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
  (with-eval-after-load "tex-buf"
    (spacemacs/set-leader-keys-for-major-mode 'latex-mode "e" 'TeX-error-overview)
    (define-key TeX-error-overview-mode-map (kbd "<return>") 'TeX-error-overview-jump-to-source))

  ;; pdf config
  (with-eval-after-load "pdf-view"
    (define-key pdf-view-mode-map (kbd "C-<return>") 'pdf-isearch-sync-backward))

  ;; Python config
  (with-eval-after-load "flycheck"
    (require 'flycheck-mypy)
    (flycheck-add-next-checker 'python-flake8 'python-mypy t)
    (flycheck-add-next-checker 'python-pyright 'python-flake8 t)
    (flycheck-remove-next-checker 'python-flake8 'python-pylint))
  (with-eval-after-load "python"
    (setq-default python-test-runner 'pytest)
    (add-hook 'pyvenv-post-activate-hooks
              #'(lambda ()
                  (call-interactively #'lsp-workspace-restart)))
    ;; (add-hook 'python-mode-hook #'(lambda () (push '(company-capf company-yasnippet) company-backends))) ; breaks lsp?
    ;; (remove-hook 'python-mode-hook 'py-autopep8-enable-on-save)
    (require 'numpydoc)
    (setq-default numpydoc-insertion-style 'yas
                  numpydoc-insert-examples-block nil)
    )

  (with-eval-after-load 'dap-mode
    (setq-default dap-python-debugger 'debugpy)
    (dap-register-debug-template
     "Python :: Run file (buffer)"
     (list :type "python"
           :args ""
           :cwd "${workspaceFolder}"
           :module nil
           :program nil
           :request "launch"
           :name "Python :: Run file (buffer)"))

    (dap-register-debug-template
     "Python :: Run project"
     (list :type "python"
           :args ""
           :cwd "${workspaceFolder}"
           :module nil
           :program nil
           :request "launch"
           :name "Python :: Run project")))

  ;; (with-eval-after-load 'ein:notebook
  ;;   (add-hook 'ein:notebook-mode-hook
  ;;             #'(lambda ()
  ;;                 (define-key evil-normal-state-local-map "r" 'ein:notebook-save-notebook-command-km))))
  (with-eval-after-load 'ein:notebook
    (define-key ein:notebook-mode-map [remap save-buffer] 'ein:notebook-save-notebook-command-km))


  ;; Terminal config
  ;; (with-eval-after-load 'term
  ;;   (evil-set-initial-state 'term-mode 'emacs))
  (require 'vterm)
  (require 'multi-vterm)
  (defun scroll-hook nil
    (make-local-variable 'scroll-margin)
    (setq scroll-margin 0))
  (add-hook 'term-mode-hook #'scroll-hook)
  (add-hook 'inferior-python-mode-hook #'scroll-hook)

  (defun start-pipe-script (name)
    (interactive "sScript name: ")
    (let ((fn (concat "~/dev/scripting/" name)))
      (vterm-send-string (concat "watch -n1 " fn))
      (vterm-send-return)
      (other-window 1)
      (find-file fn)
      (write-file fn)
      (set-file-modes fn #o755)))

  (defun last-term-buffer (l)
    "Return most recently used term buffer."
    (when l
      (if (eq 'vterm-mode (with-current-buffer (car l) major-mode))
          (car l) (last-term-buffer (cdr l)))))

  (defun get-term ()
    "Switch to the term buffer last used, or create a new one if
  none exists, or if the current buffer is already a term."
    (interactive)
    (let ((b (last-term-buffer (buffer-list))))
      (if (or (not b) (eq 'vterm-mode major-mode))
          (multi-vterm)
        (switch-to-buffer b))))

  (spacemacs/set-leader-keys-for-major-mode 'vterm-mode "p" 'start-pipe-script)
  (define-key evil-normal-state-map (kbd "M-t") 'get-term)
  (define-key evil-normal-state-map (kbd "M-C-t") 'multi-vterm)
  (evil-define-key 'insert vterm-mode-map (kbd "C-e")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-f")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-a")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-v")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-x")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-b")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-w")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-u")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-d")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-n")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-m")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-o")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-p")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-j")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-k")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-r")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-t")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-g")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-c")      #'vterm--self-insert)
  (evil-define-key 'insert vterm-mode-map (kbd "C-SPC")    #'vterm--self-insert)
  (evil-define-key 'normal vterm-mode-map (kbd "C-d")      #'vterm--self-insert)
  (evil-define-key 'normal vterm-mode-map (kbd ",c")       #'multi-vterm)
  (evil-define-key 'normal vterm-mode-map (kbd ",l")       #'multi-vterm-next)
  (evil-define-key 'normal vterm-mode-map (kbd ",,")       #'multi-vterm-next)
  (evil-define-key 'normal vterm-mode-map (kbd ",h")       #'multi-vterm-prev)
  ;; (evil-define-key 'normal vterm-mode-map (kbd "i")        #'evil-insert-resume)
  ;; (evil-define-key 'normal vterm-mode-map (kbd "o")        #'evil-insert-resume)
  ;; (evil-define-key 'normal vterm-mode-map (kbd "<return>") #'evil-insert-resume)

  ;; Haskell config
  (with-eval-after-load 'intero
    (flycheck-add-next-checker 'intero '(warning . haskell-hlint)))

  ;; org-mode config
  (with-eval-after-load 'org
    (require 'helm-org-rifle)
    (use-package org-super-links
      :bind (("C-c s s" . org-super-links-link)
             ("C-c s l" . org-super-links-store-link)
             ("C-c s C-l" . org-super-links-insert-link)
             ("C-c s d" . org-super-links-quick-insert-drawer-link)
             ("C-c s i" . org-super-links-quick-insert-inline-link)
             ("C-c s C-d" . org-super-links-delete-link))
      :config (setq org-super-links-backlink-prefix nil
                    org-super-links-search-function #'my-org-super-links-org-rifle-link-search-interface))

    (defun my-org-super-links-org-rifle-link-search-interface ()
      "Search interface for helm-rifle."
      (add-to-list 'helm-org-rifle-actions '("super-link-temp" . org-super-links-org-rifle-insert-link-action) nil)
      (helm-org-rifle-buffers-and-project)
      (pop helm-org-rifle-actions))

    (helm-org-rifle-define-command
     "files-and-buffers" (&optional files)
     ""
     :sources (let ((dir-sources (--map (helm-org-rifle-get-source-for-file it) files))
                    (buffer-sources (helm-org-rifle-get-sources-for-open-buffers)))
                (nconc dir-sources
                       (loop for source in buffer-sources
                             when (not (find-if
                                        (lambda (x) (equal (helm-attr 'name x) (helm-attr 'name source)))
                                        dir-sources))
                             collect source)))
     :let ((files (helm-org-rifle--listify (or files
                                               (helm-read-file-name "Files: " :marked-candidates t))))
           (helm-candidate-separator " ")
           (helm-cleanup-hook (lambda ()
                                ;; Close new buffers if enabled
                                (when helm-org-rifle-close-unopened-file-buffers
                                  (if (= 0 helm-exit-status)
                                      ;; Candidate selected; close other new buffers
                                      (let ((candidate-source (helm-attr 'name (helm-get-current-source))))
                                        (dolist (source helm-sources)
                                          (unless (or (equal (helm-attr 'name source)
                                                             candidate-source)
                                                      (not (helm-attr 'new-buffer source)))
                                            (kill-buffer (helm-attr 'buffer source)))))
                                    ;; No candidates; close all new buffers
                                    (dolist (source helm-sources)
                                      (when (helm-attr 'new-buffer source)
                                        (kill-buffer (helm-attr 'buffer source))))))))))

    (defun helm-org-rifle-buffers-and-project ()
      (interactive)
      (let* ((directory (or (projectile-project-root) (file-name-directory buffer-file-name)))
             (files
              (-flatten
               (f-files directory
                        (lambda (file)
                          (s-matches? helm-org-rifle-directories-filename-regexp (f-filename file))) t))))
            (helm-org-rifle-files-and-buffers files)))

    (add-hook 'org-mode-hook #'turn-on-auto-fill)
    (add-hook 'org-mode-hook #'spacemacs/toggle-spelling-checking-on)

    (org-defkey org-mode-map [(shift return)] 'org-meta-return)

    (setq my-org-filter-tags '("@alcampo" "@galicia" "@sancristobal" "@workout"))
    (defun my-org-add-filter (match)
      (concat match "-" (s-join "-" my-org-filter-tags)))

    (setq-default
     org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id
     org-projectile-capture-template "* TODO %?\n%U\n%a\n"

     org-agenda-files '("~/net/gtd/inbox.org"
                        "~/net/gtd/gtd.org"
                        "~/net/gtd/calendar.org")
     org-capture-templates '(("c" "Inbox" entry
                              (file "~/net/gtd/inbox.org")
                              "* TODO %i%?")
                             ("l" "Inbox w/ link" entry
                              (file "~/net/gtd/inbox.org")
                              "* TODO %?\n%a"))
     org-refile-targets '(("~/net/gtd/gtd.org" :maxlevel . 2)
                          ("~/net/gtd/maybe.org" :maxlevel . 2))
     org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)"))
     org-agenda-prefix-format '((todo . "%-40b") (agenda . " %i %-12:c%?-12t% s") (tags . "%b") (search . " %i %-12:c"))
     org-agenda-exporter-settings '((org-agenda-prefix-format "- [ ] ")
                                    (org-agenda-remove-tags t)
                                    (org-agenda-compact-blocks t)
                                    (org-agenda-overriding-header ""))
     org-agenda-custom-commands '(("a" "Weekly Agenda"
                                   agenda "" ((org-agenda-span 8)
                                              (org-agenda-files '("~/net/gtd/calendar.org"))
                                              (org-agenda-start-day "today")))
                                  ("w" "Waiting"
                                   todo "WAITING"
                                         ((org-agenda-files '("~/net/gtd/gtd.org"))
                                          (org-agenda-overriding-header "Waiting")))
                                  ("o" "To do"
                                   ((agenda "" ((org-agenda-files '("~/net/gtd/calendar.org" "~/net/gtd/gtd.org"))
                                                (org-agenda-overriding-header "Today's appointments")
                                                (org-agenda-span 2)))
                                    (tags-todo (my-org-add-filter  "+CATEGORY=\"Tasks\"+SCHEDULED<=\"<now>\"|+CATEGORY=\"Tasks\"+SCHEDULED=\"\"")
                                               ((org-agenda-files '("~/net/gtd/gtd.org"))
                                                (org-agenda-overriding-header "Tasks")
                                                (org-agenda-sorting-strategy '(time-up todo-state-up priority-down))
                                                ))
                                    (tags-todo (my-org-add-filter "+CATEGORY=\"Projects\"+SCHEDULED<=\"<now>\"|+CATEGORY=\"Projects\"+SCHEDULED=\"\"")
                                               ((org-agenda-files '("~/net/gtd/gtd.org"))
                                                (org-agenda-overriding-header "Projects")
                                                (org-agenda-sorting-strategy '(time-up todo-state-up priority-down))
                                                (org-agenda-skip-function #'my-org-agenda-skip-all-siblings-but-first)))))
                                  ("c" . "Context")
                                  ("ca" "@alcampo" tags-todo "+@alcampo")
                                  ("cg" "@galicia" tags-todo "+@galicia")
                                  ("cs" "@sancristobal" tags-todo "+@sancristobal")
                                  ("cw" "@workout" tags-todo "+@workout")
                                  ("ct" "@togo" tags-todo "+@togo")
                                  ("d" . "Done")
                                  ("dt" "Done today" tags "+CLOSED>=\"<today>\"")
                                  ("dw" "Done this week" tags (concat "+CLOSED>=\"<"
                                                                           (this-weeks-monday)
                                                                           ">\"")))
     org-stuck-projects '("+LEVEL=2+CATEGORY=\"Projects\"/-DONE" ("TODO" "WAITING") nil "")
     org-priority-get-priority-function #'my/org-inherited-priority
     )


    ;; (add-hook 'auto-save-hook 'org-store-agenda-views)
    (add-hook 'auto-save-hook 'org-save-all-org-buffers)

    (if (and (string-match "^fpc" (system-name)) (string-match "daemon" server-name))
        (setq caldav-timer (run-at-time t 3600 'my/org-caldav-sync)))

    (defun my/org-caldav-sync ()
      (let ((ip-yes (shell-command-to-string
                      (concat
                      "ping "
                      (url-host (url-generic-parse-url org-caldav-url))
                      " -c 1 -w 1 > /dev/null && echo \"\" || echo \"noip\""))))
        (when (string= "\n" ip-yes) (org-caldav-sync))))

    (defun this-weeks-monday ()
      (let ((days-from-monday (mod (1- (nth 6 (decode-time (current-time)))) 7)))
        (format-time-string "%Y-%m-%d"
                            (time-subtract (current-time) (days-to-time days-from-monday)))))

    (defun my/org-inherited-priority (s)
      (cond

       ;; Priority cookie in this heading
       ((string-match org-priority-regexp s)
        (* 1000 (- org-priority-lowest
                   (org-priority-to-value (match-string 2 s)))))

       ;; No priority cookie, but already at highest level
       ((not (org-up-heading-safe))
        (* 1000 (- org-priority-lowest org-priority-default)))

       ;; Look for the parent's priority
       (t
        (my/org-inherited-priority (org-get-heading)))))

    (defun my-org-agenda-skip-all-siblings-but-first ()
      "Skip all but the first non-done entry."
      (let (should-skip-entry)
        (unless (org-current-is-todo)
          (setq should-skip-entry t))
        (save-excursion
          (while (and (not should-skip-entry) (org-goto-sibling t))
            (when (org-current-is-todo)
              (setq should-skip-entry t))))
        (when should-skip-entry
          (or (outline-next-heading)
              (goto-char (point-max))))))

    (defun org-current-is-todo ()
      (or (string= "TODO" (org-get-todo-state)) (string= "WAITING" (org-get-todo-state))))

    )


  ;; markdown config
  (with-eval-after-load 'markdown-mode
    (add-hook 'markdown-mode-hook #'turn-on-auto-fill))

  ;; notmuch config
  ;; (require 'notmuch) ;; not much I can do about this I think (hehe)
  ;; (add-to-list 'auto-mode-alist '("astroid@[[:alnum:]]+\\.none" . notmuch-message-mode))
  ;; (add-hook 'notmuch-message-mode-hook #'turn-on-auto-fill)
  ;; (spacemacs|add-company-backends
  ;;   :backends notmuch-company
  ;;   :modes notmuch-message-mode)

  ;; shell config

  (defun my-sh-completion-at-point-function ()
    (save-excursion
      (skip-chars-forward "[:alnum:]_")
      (let ((end (point))
            (_ (skip-chars-backward "[:alnum:]_"))
            (start (point)))
        (cond
         ((eq (char-before) ?$)
          (list start end (sh--vars-before-point)))
         ; don't provide completions on empty string
         ((or (not (char-after)) (eq (char-after) $\n)) nil)
         ((sh-smie--keyword-p)
          (list start end #'sh--cmd-completion-table))))))

  (add-hook 'sh-mode-hook
            #'(lambda ()
                (remove-hook 'completion-at-point-functions #'sh-completion-at-point-function t)
                (add-hook 'completion-at-point-functions #'my-sh-completion-at-point-function nil t)))

  ;; fixes to git-gutter+ when using tramp
  (with-eval-after-load 'git-gutter+
    ;; https://github.com/syl20bnr/spacemacs/issues/12860#issuecomment-602084919
    (defun git-gutter+-remote-default-directory (dir file)
      (let* ((vec (tramp-dissect-file-name file))
             (method (tramp-file-name-method vec))
             (user (tramp-file-name-user vec))
             (domain (tramp-file-name-domain vec))
             (host (tramp-file-name-host vec))
             (port (tramp-file-name-port vec)))
        (tramp-make-tramp-file-name method user domain host port dir)))

    (defun git-gutter+-remote-file-path (dir file)
      (let ((file (tramp-file-name-localname (tramp-dissect-file-name file))))
        (replace-regexp-in-string (concat "\\`" dir) "" file))))

  ;; direnv and envrc
  (envrc-global-mode)
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
 '(auth-source-save-behavior nil)
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   '(import-js grizzl js-doc js2-refactor multiple-cursors livid-mode nodejs-repl npm-mode skewer-mode js2-mode tern yaml-mode csv-mode sqlup-mode sql-indent seeing-is-believing rvm ruby-tools ruby-test-mode ruby-refactor ruby-hash-syntax rubocopfmt rubocop rspec-mode robe rbenv rake minitest enh-ruby-mode counsel-gtags chruby bundler inf-ruby systemd company-quickhelp realgud test-simple loc-changes load-relative flyspell-correct-helm flyspell-correct auto-dictionary selectric-mode ibuffer-projectile web-mode web-beautify tagedit slim-mode scss-mode sass-mode pug-mode prettier-js impatient-mode simple-httpd helm-css-scss haml-mode emmet-mode counsel-css counsel swiper ivy company-web web-completion-data add-node-modules-path ranger pdf-tools tablist company-reftex auctex origami yasnippet-snippets yapfify xterm-color ws-butler writeroom-mode winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org symon symbol-overlay string-inflection spaceline-all-the-icons smeargle shell-pop restart-emacs rainbow-delimiters pytest pyenv-mode py-isort popwin pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer orgit org-projectile org-present org-pomodoro org-mime org-download org-cliplink org-bullets org-brain open-junk-file neotree nameless multi-term move-text mmm-mode markdown-toc magit-svn magit-gitflow macrostep lsp-haskell lorem-ipsum live-py-mode link-hint intero indent-guide importmagic hungry-delete htmlize hlint-refactor hl-todo hindent highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-org-rifle helm-mode-manager helm-make helm-hoogle helm-gitignore helm-git-grep helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag haskell-snippets google-translate golden-ratio gnuplot gitignore-templates gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md fuzzy font-lock+ flycheck-pos-tip flycheck-package flycheck-mypy flycheck-haskell flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-textobj-line evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-modeline diminish diff-hl devdocs define-word dante cython-mode company-statistics company-ghci company-ghc company-cabal company-anaconda column-enforce-mode cmm-mode clean-aindent-mode centered-cursor-mode browse-at-remote blacken auto-yasnippet auto-highlight-symbol auto-compile attrap aggressive-indent ace-window ace-link ace-jump-helm-line ac-ispell))
 '(paradox-github-token t)
 '(safe-local-variable-values
   '((org-latex-format-options quote
                               (:foreground default :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                                            ("begin" "$1" "$" "$$" "\\(" "\\[")))
     (eval spacemacs/toggle-visual-line-navigation-on)
     (org-html-postamble-format
      ("en" " <p class=\"date\">Last Updated: %T</p>"))
     (org-html-postamble . t)
     (org-html-postamble-format
      ("en" " <p class=\"date\">Last Updated: %d</p>"))
     (eval spacemacs/toggle-spelling-checking-on)))
 '(warning-suppress-types '((ein))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
)
