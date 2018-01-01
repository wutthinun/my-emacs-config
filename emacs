(setq inhibit-startup-screen t)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(set-frame-font "Monaco-16")
(set-frame-name "Emacs")
(global-hl-line-mode t)

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

(use-package counsel
  :ensure t)

(use-package ag
  :ensure t)

(use-package swiper
  :ensure t
  :bind (
	("\C-s" . swiper)
	("C-c C-r" . ivy-resume)
	("<f6>" . ivy-resume)
	("M-x" . counsel-M-x)
	("C-x C-f" . counsel-find-file)
	("<f1> f" . counsel-describe-function)
	("<f1> v" . counsel-describe-variable)
	("<f1> l" . counsel-find-library)
	("<f2> i" . counsel-info-lookup-symbol)
	("<f2> u" . counsel-unicode-char)
	("C-c g" . counsel-git)
	("C-c j" . counsel-git-grep)
	("C-c k" . counsel-ag)
	("C-x l" . counsel-locate)
	("C-S-o" . counsel-rhythmbox))
  :config
  (progn
	(ivy-mode 1)
	(setq ivy-use-virtual-buffers t)
	(setq enable-recursive-minibuffers t)
	(define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
  ))

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

(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-completion-system 'ivy))

;; (use-package counsel-projectile
;;   :ensure t
;;   :config
;;   (counsel-projectile-on))

(use-package helm
  :ensure t)


(use-package helm-ag
  :ensure t)

(use-package emmet-mode
  :ensure t
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode))

(use-package treemacs
  :ensure t
  :defer t
  :config
  (progn
    (use-package treemacs-evil
      :ensure t
      :demand t)
    (setq treemacs-follow-after-init          t
          treemacs-width                      35
          treemacs-indentation                2
          treemacs-collapse-dirs              (if (executable-find "python") 3 0)
          treemacs-silent-refresh             nil
          treemacs-change-root-without-asking nil
          treemacs-sorting                    'alphabetic-desc
          treemacs-show-hidden-files          t
          treemacs-never-persist              nil
          treemacs-is-never-other-window      nil
          treemacs-goto-tag-strategy          'refetch-index)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'extended))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ([f8]         . treemacs-toggle)
        ("M-0"        . treemacs-select-window)
        ("C-c 1"      . treemacs-delete-other-windows)
        ("M-n ft"     . treemacs-toggle)
        ("M-n fT"     . treemacs)
        ("M-n fB"     . treemacs-bookmark)
        ("M-n f C-t"  . treemacs-find-file)
        ("M-n f M-t"  . treemacs-find-tag)))
(use-package treemacs-projectile
  :defer t
  :ensure t
  :config
  (setq treemacs-header-function #'treemacs-projectile-create-header)
  :bind (:map global-map
              ("M-n fP" . treemacs-projectile)
              ("M-n fp" . treemacs-projectile-toggle))
  )

;; ====================================================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (treemacs-projectile emmet-mode emmet helm ag web-mode which-key use-package solarized-theme smex org-bullets lorem-ipsum iedit evil counsel avy auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'narrow-to-region 'disabled nil)
