;; Open split terminal on launch
;; (add-hook 'emacs-startup-hook
;;   (lambda ()
;;     (let ((w (split-window-below 2)))
;;       (select-window w)
;;       (minimize-window)
;; 	  (enlarge-window 5)
;;       (term "/bin/bash"))
;;       (switch-to-buffer "*terminal*")))
