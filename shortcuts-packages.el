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
(global-set-key (kbd "C-c m f") 'vc-diff)

(global-set-key (kbd "C-t") 'projectile-find-file)
(global-set-key (kbd "C-b") 'highlight-symbol)
(global-set-key (kbd "C-n") 'highlight-symbol-remove-all)
;; (require 'highlight-symbol)
;; (global-set-key [(control f3)] 'highlight-symbol)
;; (global-set-key [f3] 'highlight-symbol-next)
;; (global-set-key [(shift f3)] 'highlight-symbol-prev)
;; (global-set-key [(meta f3)] 'highlight-symbol-query-replace)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
