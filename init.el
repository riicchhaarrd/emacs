(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-hl-line-mode nil)
 '(show-paren-mode t)
 '(ido-mode (quote buffer) nil (ido))
 '(auto-dim-other-buffers-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes '(custom))
 '(custom-safe-themes
   '("4240f4cf3d30b67bf750c21d936fa4c5470eb115614198f0678162608c72a709" default))
 '(ediff-split-window-function 'split-window-horizontally t)
 '(horizontal-scroll-bar-mode nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(treemacs-magit auto-dim-other-buffers borland-blue-theme ace-jump-mode expand-region php-mode wgrep iedit projectile git-timemachine highlight-symbol ccls magit zenburn-theme solarized-theme gruvbox-theme rainbow-delimiters highlight-numbers plantuml-mode org-download org-superstar org-ref ox-twbs org-bullets yasnippet-snippets lsp-ui evil company-lsp use-package treemacs naysayer-theme clang-format which-key))
 '(scroll-conservatively 10)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "MS  " :slant normal :weight normal :height 97 :width normal))))
 '(ediff-even-diff-A ((t (:extend t :background "#fad9d9"))))
 '(ediff-even-diff-B ((t (:extend t :background "aquamarine"))))
 '(ediff-odd-diff-A ((t (:extend t :background "#f6baba"))))
 '(ediff-odd-diff-B ((t (:extend t :background "aquamarine"))))
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
(load-user-file "resize-frame.el")

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
;; note to self when using borland-blue theme
;; change the fore and backcolors to
;; :foreground "#f0ef6e"
;; :background "#001aa3"

(defun mwheel-scroll-all-function-all (func &optional arg)
  (if (and scroll-all-mode arg)
      (save-selected-window
        (walk-windows
         (lambda (win)
           (select-window win)
           (condition-case nil
               (funcall func arg)
             (error nil)))))
    (funcall func arg)))

(defun mwheel-scroll-all-scroll-up-all (&optional arg)
  (mwheel-scroll-all-function-all 'scroll-up arg))

(defun mwheel-scroll-all-scroll-down-all (&optional arg)
  (mwheel-scroll-all-function-all 'scroll-down arg))

(setq mwheel-scroll-up-function 'mwheel-scroll-all-scroll-up-all)
(setq mwheel-scroll-down-function 'mwheel-scroll-all-scroll-down-all)
