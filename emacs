(setq inhibit-startup-screen t)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(set-frame-font "Monaco-16")
(set-frame-name "Emacs")
(global-hl-line-mode t)
(global-linum-mode 1)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package evil
  :ensure t
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; (use-package smex
;;   :ensure t
;;   :config
;;   (global-set-key (kbd "M-x") 'smex)
;;   (global-set-key (kbd "M-X") 'smex-major-mode-commands))

(use-package solarized-theme
  :ensure t
  :config (load-theme 'solarized-dark t))

(use-package org-bullets
  :ensure t
  :config (add-hook 'org-mode-hook 'org-bullets-mode))

;; (setq indo-enable-flexible-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)

;; (use-package counsel
;;   :ensure t)

;; (use-package swiper
;;   :ensure t
;;   :bind (
;; 	("\C-s" . swiper)
;; 	("C-c C-r" . ivy-resume)
;; 	("<f6>" . ivy-resume)
;; 	("M-x" . counsel-M-x)
;; 	("C-x C-f" . counsel-find-file)
;; 	("<f1> f" . counsel-describe-function)
;; 	("<f1> v" . counsel-describe-variable)
;; 	("<f1> l" . counsel-find-library)
;; 	("<f2> i" . counsel-info-lookup-symbol)
;; 	("<f2> " . counsel-unicode-char)
;; 	("C-c g" . counsel-git)
;; 	("C-c j" . counsel-git-grep)
;; 	("C-c k" . counsel-ag)
;; 	("C-x l" . counsel-locate)
;; 	("C-S-o" . counsel-rhythmbox))
;;   :config
;;   (progn
;; 	(ivy-mode 1)
;; 	(setq ivy-use-virtual-buffers t)
;; 	(setq enable-recursive-minibuffers t)
;; 	(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
;;   ))

;; (use-package projectile
;;   :ensure t
;;   :config
;;   (projectile-global-mode)
;;   (setq projectile-completion-system 'ivy))

;; (use-package counsel-projectile
;;   :ensure t
;;   :config
;;   (counsel-projectile-on))

(use-package avy
  :ensure t
  :bind ("M-s" . avy-goto-char))

(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    ))

(use-package iedit
  :ensure t)

(use-package lorem-ipsum
  :ensure t
  :config
  (lorem-ipsum-use-default-bindings))

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue?\\'" . web-mode))
  (setq web-mode-ac-sources-alist
	'(("css" . (ac-source-css-property))
	  ("vue" . (ac-source-words-in-buffer ac-source-abbrev))
	  ("html" . (ac-source-words-in-buffer ac-source-abbrev))))
  (setq web-mode-anable-auto-closing t)
  (setq web-mode-anable-auto-quoting t))



;; Helm ====================================
(use-package helm
  :ensure t
  :config
  (helm-mode 1)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (global-set-key (kbd "C-x b") #'helm-mini))


(use-package helm-ag
  :ensure t
  :config
  (global-set-key (kbd "C-s") #'helm-do-ag-this-file))

(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

(use-package ac-helm
  :ensure t
  :config
  (global-set-key (kbd "C-:") 'ac-complete-with-helm)
  (define-key ac-complete-mode-map (kbd "C-:") 'ac-complete-with-helm))

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode))

(use-package neotree
  :ensure t)

(use-package ag
  :ensure t)
;; ====================================================
