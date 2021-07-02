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
(load-user-file "backup.el")
(load-user-file "modes.el")
(load-user-file "language.el")
(load-user-file "clang.el")
(load-user-file "variables.el")
(load-user-file "shortcuts.el")
(load-user-file "shortcuts-functions.el")
(load-user-file "shortcuts-packages.el")
(load-user-file "treemacs.el")

(server-start) ;; so we can use a bash script and windmove using emacsclient
