;; should be default functions in emacs

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-s") 'save-buffer)

;; (global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key [(control f)] 'isearch-forward)

(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings 'super))

;; (global-set-key (kbd "M-<left>")  'windmove-left)
;; (global-set-key (kbd "M-<right>") 'windmove-right)
;; (global-set-key (kbd "M-<up>")    'windmove-up)
;; (global-set-key (kbd "M-<down>")  'windmove-down)
