;; Clang stuff
(require 'clang-format)
(setq clang-format-style "file")
(setq clang-format-style-option "file")
(setq clang-format-fallback-style "Microsoft")
;;(fset 'c-indent-region 'clang-format-region)
(with-eval-after-load 'cc-mode
  (fset 'c-indent-region 'clang-format-region))

;; (with-eval-after-load 'cc-mode
;;   (fset 'c-indent-region 'clang-format-region)
;;   (bind-keys :map c-mode-base-map
;;              ("<C-tab>" . company-complete)
;;              ("M-." . my-goto-symbol)
;;              ("M-," . xref-pop-marker-stack)
;;              ("C-M-\\" . clang-format-region)
;;              ("C-i" . clang-format)
;;              ("C-." . my-imenu)
;;              ("M-o" . cff-find-other-file))
;;   (when use-rtags
;;     (bind-key "M-?" 'rtags-display-summary c-mode-base-map)))
