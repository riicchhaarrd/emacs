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
(load-user-file "custom.el")
(load-user-file "install.el")
