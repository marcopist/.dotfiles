;; Set up package archives
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Install and configure packages
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Rust configuration
(use-package rustic
  :ensure t
  :config
  ;; Set path to rust-analyzer binary
  (setq rustic-lsp-server 'rust-analyzer)
  ;; Use LSP for code completion, syntax checking, etc.
  (add-hook 'rustic-mode-hook #'lsp))

;; Optional: Set up company mode for auto-completion
(use-package company
  :ensure t
  :config
  (add-hook 'rustic-mode-hook 'company-mode))

;; Optional: Set up flycheck for syntax checking
(use-package flycheck
  :ensure t
  :config
  (add-hook 'rustic-mode-hook 'flycheck-mode))

;; Optional: Set up format-on-save using rustfmt
(add-hook 'rustic-mode-hook
          (lambda ()
            (add-hook 'before-save-hook #'rustic-format-buffer nil 'local)))

;; Optional: Configure keybindings
(add-hook 'rustic-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-c") #'rustic-cargo-run)
            (local-set-key (kbd "C-c C-t") #'rustic-cargo-test)))

;; Theme (Optional)
(use-package solarized-theme
  :ensure t
  :init
  (load-theme 'solarized-dark t))
