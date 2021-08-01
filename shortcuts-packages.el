;; using undo-tree package

(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-y") 'undo-tree-redo)

;; treemacs keybinds
(global-set-key (kbd "C-c t") 'treemacs)

;; magit keybinds
(global-set-key (kbd "C-c m d") 'magit-diff-buffer-file)

(defun my-ediff-before-setup-hook ()
  (if (treemacs-get-local-window)
      (delete-window (treemacs-get-local-window))
    )
  (scroll-all-mode t)
  (scroll-bar-mode t)
)
(add-hook 'ediff-before-setup-hook 'my-ediff-before-setup-hook)

(defun fun_me ()
  (interactive)
  (my-ediff-before-setup-hook)
  (magit-ediff-show-unstaged buffer-file-name)
)

(global-set-key (kbd "C-c m e") 'fun_me)

(defun my-ediff-quit-hook ()
  ;;(switch-to-buffer "*Ediff Control Panel*")
  ;;(ediff-quit t)
  ;;(kill-buffer)
  (scroll-all-mode -1)
  (scroll-bar-mode -1)
  (treemacs)
  (message "Closed diff")
)

(add-hook 'ediff-after-quit-hook-internal 'my-ediff-quit-hook)

;; use 1 through 4 to expand the sections
;; and s to stage files, c c to commit C-c C-c and b b to switch to another branch
;; https://www.emacswiki.org/emacs/Magit
;; P u to git push
;; F u to git pull
(global-set-key (kbd "C-c m s") 'magit-status)
(global-set-key (kbd "C-c m f") 'vc-diff)

(global-set-key (kbd "C-t") 'projectile-find-file)
;; (global-set-key (kbd "C-b") 'highlight-symbol)
;; (global-set-key (kbd "C-n") 'highlight-symbol-remove-all)
;; (require 'highlight-symbol)
;; (global-set-key [(control f3)] 'highlight-symbol)
;; (global-set-key [f3] 'highlight-symbol-next)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
