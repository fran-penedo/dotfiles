(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("146d24de1bb61ddfa64062c29b5ff57065552a7c4019bee5d869e938782dfc2a" default)))
 '(custom-theme-directory "~/.emacs.d/lisp")
 '(haskell-mode-hook (quote (turn-on-haskell-indentation))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq-default inhibit-startup-screen t)

;; CEDET
;;(add-to-list 'load-path "~/.emacs.d/cedet-1.1/common")
;;(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")

;;(semantic-load-enable-gaudy-code-helpers)
;;(global-semantic-idle-completions-mode nil)
;;(global-semantic-decoration-mode nil)

;;(setq-default cedet-java-jdk-root "/usr/lib/jvm/java-1.6.0-openjdk-amd64/")
;;(setq-default semanticdb-javap-classpath '("/usr/lib/jvm/java-1.6.0-openjdk-amd64/jre/lib/rt.jar" "/home/fran/.ptII8.0.1/myActors/Jama-1.0.3.jar"))

;;(require 'semantic/sb)
;;(require 'semantic-ia)
;;(require 'semanticdb)
;;(require 'semanticdb-javap)

;; No UI
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

;; Indentation
(setq-default indent-tabs-mode nil)

;; Repositories
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)


(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/elpa/zenburn-theme-20140613.207")

;; Auto complete

(when (require 'auto-complete-config nil 'noerror)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict")
  (ac-config-default)
  (global-auto-complete-mode t)
  (setq ac-auto-start 2)
  ;; show menu immediately...
  (setq ac-auto-show-menu t)
  ;; explicit call to auto-complete
  (define-key ac-mode-map [(control return)] 'auto-complete)
  (setq-default ac-sources (append ac-sources '(ac-source-semantic))))

;; ESS
;;(require 'ess-site)

;; python
(load-file "~/.emacs.d/lisp/emacs-for-python/epy-init.el")

;; Shell color
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;  bindings
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key (kbd "<f9>") 'compile)
(global-set-key (kbd "RET") 'newline-and-indent)

;; alias
(defalias 'rrx 'replace-regexp)

(require 'slime nil 'noerror)


;; theme
(load-theme 'zenburn)

(defun on-frame-open (frame)
    (if (not (display-graphic-p frame))
            (set-face-background 'default "unspecified-bg" frame)))
(on-frame-open (selected-frame))
(add-hook 'after-make-frame-functions 'on-frame-open)

(defun on-after-init ()
    (unless (display-graphic-p (selected-frame))
          (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)



;(set-face-attribute 'default t :font "Inconsolata:pixelsize=12:antialiasing=true:hinting=true")
(set-default-font "Inconsolata-12")


;; backspace
(global-set-key "\C-h" 'backward-kill-word)

;; overrides mark-whole-buffer
(global-set-key "\C-x\C-h" 'help-command)
