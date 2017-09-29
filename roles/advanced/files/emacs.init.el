;; add personal elisp lib dir to path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; enable melpa and marmalade package manager
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives
             '("marmalade" . "https://marmalade-repo.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; helper functions to install packages
(defun require-package (p)
  (unless (package-installed-p p)
    (package-install p))
  (require p))

;; use-package comes from package.el and is only
;; available for melpa and elpa
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))
(require 'use-package)

;; install and enable packages
;; following packages are from melpa/elpa
(use-package better-defaults
  :ensure t)
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode) ;; enable company for all buffers
  (global-set-key (kbd "C-M-/") 'company-complete) ;; use C-M-/ to force company-complete
)
(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  (setq elpy-rpc-backend "jedi")
)
(use-package sr-speedbar
  :ensure t)
(use-package dark-mint-theme
  :ensure t)

;; UI customization
(load-theme 'dark-mint t)
;enlarge default font
(set-face-attribute 'default nil :height 130)
;; to enable the line number on the left
(global-linum-mode t)
;; show column number as well
(setq column-number-mode t)
; enable global cursor line highlighting mode
(global-hl-line-mode t)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; setup tabs
(setq c-basic-indent 4)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 4 200 4))

;; dired copy to another buffer
(setq dired-dwim-target t)

;; set default fill-column
(setq-default fill-column 80)

;; verilog-mode
(add-hook 'verilog-mode-hook '(lambda ()
    (add-hook 'local-write-file-hooks (lambda()
       (untabify (point-min) (point-max))))))

;; set up recentf
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Customize    
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (pabbrev dark-mint-theme sr-speedbar elpy company better-defaults use-package)))
 '(tab-always-indent t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; setup back-up
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
 )

;; setup clipboard
(setq x-select-enable-clipboard t)

;; cua rectangle support
(cua-selection-mode t)

;; set default tramp mode to be ssh to make it faster
(setq tramp-default-method "ssh")

;; org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;quickly move between windows S-up, S-down, S-left, S-right (S for Shift)
(windmove-default-keybindings)

;; predictive abbreviation expansion
(require-package 'pabbrev)
(require 'pabbrev)

; only supported for emacs 24.4 above
;(global-set-key (kbd "C-*") 'isearch-forward-symbol-at-point)

; alias all yes to no to y or n
(defalias 'yes-or-no-p 'y-or-n-p)