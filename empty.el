;; (add-hook 'after-init-hook
;;           (lambda ()
;;             ;; No splash screen
;;             (setq inhibit-startup-screen t)
;; 
;;             ;; If the *scratch* buffer is the current one, then create a new
;;             ;; empty untitled buffer to hide *scratch*
;;             (if (string= (buffer-name) "*scratch*")
;;                 (new-empty-buffer))
;;             )
;;           t) ;; append this hook to the tail
