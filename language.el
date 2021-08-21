(setq c-default-style "stroustrup")
(setq-default tab-width 4)
;; (setq-default indent-tabs-mode t)
;; (setq-default indent-tabs-mode 'only)

(add-to-list 'auto-mode-alist '("\\.gsc\\'" . c-mode))
(add-hook 'c-mode-common-hook 'superword-mode)
;; (add-hook 'c-mode-common-hook 'global-linum-mode)

(require 'rainbow-delimiters)
;; (add-hook 'c-mode-common-hook 'rainbow-delimeters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; https://stackoverflow.com/questions/24344611/emacs-weirdness-when-trying-to-comment-in-assembly
(defun my-hook ()
  (local-set-key ";" 'self-insert-command))

(add-hook 'asm-mode-hook 'my-hook)

;; enable c autocomplete stuff
(use-package lsp-mode :commands lsp)
(use-package lsp-ui :commands lsp-ui-mode)
(use-package company-lsp :commands company-lsp)

(use-package ccls
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
         (lambda () (require 'ccls) (lsp))))

(setq lsp-file-watch-threshold 2000)

(setq ccls-executable "/usr/bin/ccls")
;; (setq ccls-args '("--log-file=/tmp/ccls.log"))
