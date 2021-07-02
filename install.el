(unless package-archive-contents
  (package-refresh-contents))

(package-install-selected-packages) ;; install packages that aren't installed yet
(package-initialize) ;; load all the packages
