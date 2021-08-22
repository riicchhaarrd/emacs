;;; resize-frame.el --- A minor mode to resize frames easily.  -*- lexical-binding: t; -*-

;; Copyright (C) 2014  kuanyui

;; Author: kuanyui <azazabc123@gmail.com>
;; Keywords: frames, tools, convenience
;; License: WTFPL 1.0

;;; Commentary:

;; Press "ESC `" and use arrow-keys or i/j/k/l to adjust frames. press any key to done.

;;; Code:

(defvar resize-frame-map
  (let ((map (make-keymap)))
    (define-key map (kbd "<up>") 'enlarge-window)
    (define-key map (kbd "<down>") 'shrink-window)
    (define-key map (kbd "<right>") 'enlarge-window-horizontally)
    (define-key map (kbd "<left>") 'shrink-window-horizontally)
    (set-char-table-range (nth 1 map) t 'resize-frame-done)
    (define-key map (kbd "C-p") 'windmove-swap-states-up)
    (define-key map (kbd "C-n") 'windmove-swap-states-down)
    (define-key map (kbd "C-j") 'windmove-swap-states-right)
    (define-key map (kbd "C-k") 'windmove-swap-states-left)
    (define-key map (kbd "C-f") 'enlarge-window-horizontally)
    ;; (define-key map (kbd "C-b") 'shrink-window-horizontally)
    (define-key map (kbd "C-b") 'resize-frame-done)
    map))

(define-minor-mode resize-frame
  "A simple minor mode to resize-frame.
C-c C-c to apply."
  ;; The initial value.
  :init-value nil
  ;; The indicator for the mode line.
  :lighter " ResizeFrame"
  ;; The minor mode bindings.
  :keymap resize-frame-map
  :global t
  (if (<= (length (window-list)) 1)
      (progn (setq resize-frame nil)
             (message "Only root frame exists, abort."))
      (message "Use arrow-keys or i/j/k/l to adjust frames.")))

(defun resize-frame-done ()
  (interactive)
  (setq resize-frame nil)
  (message "Done."))

(global-set-key (kbd "ESC `") 'resize-frame)
(global-set-key (kbd "C-b") 'resize-frame)

(provide 'resize-frame)
;;; resize-frame.el ends here
