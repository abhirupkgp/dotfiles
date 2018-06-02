(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(menu-bar-mode -1)

;; fill column 80 character rule
(setq-default fill-column 80)
;;Autofill mode
(global-set-key (kbd "C-c q") 'auto-fill-mode)

(show-paren-mode 1)
(setq show-paren-delay 0)
(setq frame-title-format "emacs")

(require 'package)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;;Bootstrap for use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
(require 'use-package))

;;(require 'diminish)
(require 'bind-key)

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))


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

(use-package beacon
  :ensure t
  :init
(beacon-mode 1))
