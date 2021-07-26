(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes '(borland-blue))
 '(custom-safe-themes
   '("f5e984f4dd51243ad7eeebc318f3338a84ff3b86718ae9e62f3acf9ab877e94f" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "cbdcdfe96e7c6ff03439fcefc964ed5e6b071d558088b852243dffe3b93c9df4" default))
 '(ediff-split-window-function 'split-window-horizontally t)
 '(horizontal-scroll-bar-mode nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(borland-blue-theme ace-jump-mode expand-region php-mode wgrep iedit projectile git-timemachine highlight-symbol ccls magit zenburn-theme solarized-theme gruvbox-theme rainbow-delimiters highlight-numbers plantuml-mode org-download org-superstar org-ref ox-twbs org-bullets yasnippet-snippets lsp-ui evil company-lsp use-package treemacs naysayer-theme clang-format which-key))
 '(scroll-conservatively 10)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "More Perfect DOS VGA" :foundry "SWAP" :slant normal :weight normal :height 119 :width normal))))
 '(minibuffer-prompt ((t (:background "black" :foreground "#F0DFAF" :weight bold)))))

;; https://stackoverflow.com/questions/2079095/how-to-modularize-an-emacs-configuration/2079146

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;; load custom emacs settings
(load-user-file "install.el")
(load-user-file "backup.el")
(load-user-file "modes.el")
(load-user-file "language.el")
(load-user-file "clang.el")
(load-user-file "variables.el")
(load-user-file "treemacs.el")
(load-user-file "org.el")
(load-user-file "shortcuts.el")
(load-user-file "shortcuts-packages.el")
(load-user-file "shortcuts-functions.el")

;; TODO move these settings to other files

;; saner ediff default
(setq ediff-diff-options "-w")
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; (add-hook 'ediff-before-setup-hook 'make-frame)
;; (add-hook 'ediff-quit-hook 'delete-frame)

;; https://emacs.stackexchange.com/questions/9322/how-can-i-quit-ediff-immediately-without-having-to-type-y
(defun disable-y-or-n-p (orig-fun &rest args)
  (cl-letf (((symbol-function 'y-or-n-p) (lambda (prompt) t)))
    (apply orig-fun args)))

(advice-add 'ediff-quit :around #'disable-y-or-n-p)

;; (server-start) ;; so we can use a bash script and windmove using emacsclient

(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
