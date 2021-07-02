;; (set-face-attribute 'treemacs-directory-face nil :family "Consolas for Powerline")
(use-package treemacs)
(dolist (face '(treemacs-root-face
              treemacs-git-unmodified-face
              treemacs-git-modified-face
              treemacs-git-renamed-face
              treemacs-git-ignored-face
              treemacs-git-untracked-face
              treemacs-git-added-face
              treemacs-git-conflict-face
              treemacs-directory-face
              treemacs-directory-collapsed-face
              treemacs-file-face
              treemacs-tags-face))
  (set-face-attribute face nil :family "Segoe UI" :height 110))

;; (treemacs-toggle-fixed-width)
