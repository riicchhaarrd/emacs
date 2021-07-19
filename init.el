(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes '(custom))
 '(custom-safe-themes
   '("f5e984f4dd51243ad7eeebc318f3338a84ff3b86718ae9e62f3acf9ab877e94f" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" "ae5b216c8bf4c27e6de9cc7627e5fac03915fe1a5ce5c35eacb8860fa4a4cb94" "36d890facd489128e70af97d73899d0a4cbab7c8e6971f7dba64a6e7764fcaa0" "51ba8411a3c669279cba2e3d35d6a260986e95e57a9734bdd6c23af658117429" default))
 '(ediff-split-window-function 'split-window-horizontally)
 '(horizontal-scroll-bar-mode nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(git-timemachine highlight-symbol ccls magit zenburn-theme solarized-theme gruvbox-theme rainbow-delimiters highlight-numbers plantuml-mode org-download org-superstar org-ref ox-twbs org-bullets yasnippet-snippets lsp-ui evil company-lsp use-package treemacs naysayer-theme clang-format which-key))
 '(scroll-bar-mode nil)
 '(scroll-conservatively 10)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "MS  " :slant normal :weight normal :height 103 :width normal))))
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

;; (server-start) ;; so we can use a bash script and windmove using emacsclient
