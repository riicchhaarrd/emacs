;; using undo-tree package

(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-y") 'undo-tree-redo)

;; treemacs keybinds
(global-set-key (kbd "C-c t") 'treemacs)

;; magit keybinds
(global-set-key (kbd "C-c m d") 'magit-diff-buffer-file)
;; use 1 through 4 to expand the sections
;; and s to stage files, c c to commit C-c C-c and b b to switch to another branch
;; https://www.emacswiki.org/emacs/Magit
;; P u to git push
;; F u to git pull
(global-set-key (kbd "C-c m s") 'magit-status)
