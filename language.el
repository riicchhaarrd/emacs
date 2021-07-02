(setq c-default-style "stroustrup")
(setq-default tab-width 4)
;; (setq-default indent-tabs-mode t)
;; (setq-default indent-tabs-mode 'only)

(add-to-list 'auto-mode-alist '("\\.gsc\\'" . c-mode))
(add-hook 'c-mode-common-hook 'superword-mode)
(add-hook 'c-mode-common-hook 'global-linum-mode)

(require 'rainbow-delimiters)
;; (add-hook 'c-mode-common-hook 'rainbow-delimeters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; https://stackoverflow.com/questions/24344611/emacs-weirdness-when-trying-to-comment-in-assembly
(defun my-hook ()
  (local-set-key ";" 'self-insert-command))

(add-hook 'asm-mode-hook 'my-hook)
