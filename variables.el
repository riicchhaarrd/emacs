(setq cua-keep-region-after-copy t)
(setq inhibit-eol-conversion t)
(setq mouse-wheel-progressive-speed nil)
;; (set-face-attribute 'region nil :background "#666")
;; (setq-default cursor-type 'bar)
;; (set-cursor-color "#000000")
(customize-set-variable 'scroll-bar-mode nil)
(customize-set-variable 'horizontal-scroll-bar-mode nil)

;; https://stackoverflow.com/questions/3631220/fix-to-get-smooth-scrolling-in-emacs
(setq scroll-conservatively 10)
;; (setq scroll-margin 7)
;; (setq desktop-save t)

;; (defadvice split-window (after move-point-to-new-window activate)
;;   "Moves the point to the newly created window after splitting."
;;   (other-window 1))

(setq magit-ediff-dwim-show-on-hunks t)
(winner-mode t)
(add-hook 'ediff-after-quit-hook-internal 'winner-undo)
;; https://stackoverflow.com/questions/9433013/can-i-make-emacs-grep-windows-just-use-the-other-window-to-open-files-in
;; This will prevent Emacs from splitting windows automatically (horizontally or vertically). This might be undesirable in other situations, but this should do the job. Try it for a week or so and see if it disrupts your flow.
(setq split-height-threshold nil
      split-width-threshold nil)
