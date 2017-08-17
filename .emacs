(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-enable-flex-matching t)
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;appearance
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(menu-bar-mode -1)
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(use-package auto-complete
  :ensure t
  :init
  (ac-config-default)
  :config
  (setq ac-delay 0.02))


(use-package autopair
  :ensure t
  :config
  (autopair-global-mode t))

(use-package smex
  :ensure t
  :bind (("M-x" . smex)
	 ("C-c C-c M-x" . execute-extended-command)))

(use-package windmove
  :ensure t
  :init
  (windmove-default-keybindings 'meta))

(winner-mode t)

;;ESS
(require 'ess-site)
;;Autofill mode
(global-set-key (kbd "C-c q") 'auto-fill-mode)
;;80 character rule
(setq-default fill-column 80)

;;customization for auctex
(require 'auto-complete-auctex)
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq TeX-save-query nil)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

;; ### Set Atril as the default PDF viewer.
(eval-after-load "tex"
  '(setcar (cdr (assoc 'output-pdf TeX-view-program-selection)) "Atril"))


;; Font customization by major mode.
;; this will be continuously updated as my tastes change.
(progn
  ;; use variable-width font for some modes
  (defun xah-use-variable-width-font ()
    "Set current buffer to use variable-width font."
    (variable-pitch-mode 1)
    (text-scale-increase 0.5)
    (set-frame-font "DejaVu Sans Mono" t)
    )
  (add-hook 'latex-mode-hook 'xah-use-variable-width-font)
)

(use-package magit
  :ensure t)
(use-package beacon
  :ensure t
  :init
  (beacon-mode 1))
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq frame-title-format "emacs")
(setq scroll-step 1) ;; keyboard scroll one line at a time

(require 'ess-site)

;;Org mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-directory "~/Dropbox/owncloud/org")
(setq org-agenda-files (list "~/Dropbox/owncloud/org/todo.org"))

(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cc" 'org-capture)
(put 'scroll-left 'disabled nil)

;;c sharp mode
(use-package csharp-mode
  :ensure t
  )
(defun my-csharp-mode-hook ()
  ;; enable the stuff you want for C# here
  (electric-pair-local-mode 1) ;; Emacs 25
  )
(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)

;;multiple-cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;;expand-region
(use-package expand-region
  :ensure t
  :init
  (global-set-key (kbd "C-=") 'er/expand-region))

;;ace-jump-mode
(use-package ace-jump-mode
  :ensure t)
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;;C-c SPC is ace jump character mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;;ido mode
(require 'ido)
(ido-mode t)
;;flex ido
(use-package flx-ido
  :ensure t)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq flx-ido-threshold 1000)


;;ag.el
(use-package ag
  :ensure t)
(setq ag-highlight-search t)
(global-set-key (kbd "C-c f") 'ag-project)
(global-set-key (kbd "C-c a") 'ag)
(setq ag-reuse-buffers t)
(add-hook 'ag-mode-hook
          (lambda ()
            (copy-face 'lazy-highlight 'ag-match-face)))

;;projectile
(use-package projectile
  :ensure t
  :config
  (projectile-mode))


