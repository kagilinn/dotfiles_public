;; -*- tab-width: 8; indent-tabs-mode: t; lexical-binding: t -*-
;; vim: set tabstop=8 shiftwidth=2 noexpandtab :

;; <leaf-install-code>
(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
		       ("gnu" . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))
;; </leaf-install-code>

(leaf leaf-tree
  :ensure t
  :custom ((imenu-list-size . 30)
	   (imenu-list-position . 'left)))

(leaf leaf-convert :ensure t)

(leaf leaf-manager :ensure t)

(leaf cmake-mode
  :ensure t
  :mode ((("/CMakeLists\\.txt\\'") . cmake-mode)))

(leaf groovy-mode
  :ensure t
  :mode ((("\\.groovy\\'" "\\.gradle\\'") . groovy-mode)))

(leaf kotlin-mode
  :ensure t
  :mode ((("\\.kt\\'") . kotlin-mode)))

(leaf zig-mode
  :ensure t
  :mode ((("\\.zig\\'") . zig-mode)))

(leaf eglot
  :hook ((c-mode-hook . eglot-ensure)
	 (c++-mode-hook . eglot-ensure)
	 (csharp-mode-hook . eglot-ensure)
	 (kotlin-mode-hook . eglot-ensure)))

(leaf company
  :ensure t
  :blackout t
  :leaf-defer nil
  :hook ((    c-mode-hook . company-mode)
	 (  c++-mode-hook . company-mode)
	 (csharp-mode-hook . company-mode)
	 ( perl-mode-hook . company-mode)
	 (cperl-mode-hook . company-mode)))

(leaf cus-start
  :setq-default `((tab-bar-show                  . t)
		  (tab-bar-new-tab-choice        . "*scratch*")
		  (tab-bar-close-last-tab-choice . 'delete-frame)

		  (tab-width        . 4)
                  (indent-tabs-mode . nil))
  ;; :custom `((VARIABLE-NAME . VALUE)
  ;;           (VARIABLE-NAME . VALUE))
  :config
  (when window-system
    (tab-bar-mode 1)
    (set-frame-size (selected-frame) 165 37))
  (global-display-line-numbers-mode t))

(leaf whitespace
  :tag "builtin"
  :ensure t
  :hook (after-init-hook . global-whitespace-mode)
  :custom
  ((whitespace-style . '(face
			 trailing
			 tabs))))

(leaf autorevert
  :custom ((auto-revert-interval . 0.5))
  :global-minor-mode global-auto-revert-mode)

(leaf recentf
  :pre-setq `((byte-compile-warnings . '(cl-functions)))
  :init
  (leaf recentf-ext :ensure t)
  :custom
  `((recentf-save-file       . "~/.emacs.d/.recentf")
    (recentf-max-saved-items . 256)
    (recentf-auto-cleanup    . 'never)
    (recentf-exclude         . '(".recentf")))
  :config
  (global-set-key (kbd "C-x C-g") 'recentf-open-files)
  (recentf-mode 1))

(leaf treemacs
  :ensure t
  :bind ()
  :config
  (setq treemacs-width 35))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist '(("*" . "~/.emacs.d/backup-file")))
 '(custom-enabled-themes '(deeper-blue))
 '(make-backup-files t)
 '(package-selected-packages '(eglot-inactive-regions)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq recentf-auto-save-timer (run-with-idle-timer 60 t 'recentf-save-list))
