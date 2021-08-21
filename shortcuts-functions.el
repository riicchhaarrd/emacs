;; custom functions bound to shortcuts

;; some helper functions
;; http://ergoemacs.org/emacs/emacs_kill-ring.html

(defun my-delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (delete-region
   (point)
   (progn
     (forward-word arg)
     (point))))

(defun my-backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument, do this that many times.
This command does not push text to `kill-ring'."
  (interactive "p")
  (my-delete-word (- arg)))

(defun my-delete-line ()
  "Delete text from current position to end of line char.
This command does not push text to `kill-ring'."
  (interactive)
  (delete-region
   (point)
   (progn (end-of-line 1) (point)))
  (delete-char 1))

(defun my-delete-line-backward ()
  "Delete text between the beginning of the line to the cursor position.
This command does not push text to `kill-ring'."
  (interactive)
  (let (p1 p2)
    (setq p1 (point))
    (beginning-of-line 1)
    (setq p2 (point))
    (delete-region p1 p2)))

(defun indent-region-custom(numSpaces)
    (progn
        ; default to start and end of current line
        (setq regionStart (line-beginning-position))
        (setq regionEnd (line-end-position))

        ; if there's a selection, use that instead of the current line
        (when (use-region-p)
            (setq regionStart (region-beginning))
            (setq regionEnd (region-end))
        )

        (save-excursion ; restore the position afterwards
            (goto-char regionStart) ; go to the start of region
            (setq start (line-beginning-position)) ; save the start of the line
            (goto-char regionEnd) ; go to the end of region
            (setq end (line-end-position)) ; save the end of the line

            (indent-rigidly start end numSpaces) ; indent between start and end
            (setq deactivate-mark nil) ; restore the selected region
        )
    )
)

;; custom tab indent code

(defun untab-region (N)
    (interactive "p")
    (indent-region-custom -4)
)

(defun tab-region (N)
    (interactive "p")
    (if (active-minibuffer-window)
        (minibuffer-complete)    ; tab is pressed in minibuffer window -> do completion
    ; else
    (if (string= (buffer-name) "*shell*")
        (comint-dynamic-complete) ; in a shell, use tab completion
    ; else
    (if (use-region-p)    ; tab is pressed is any other buffer -> execute with space insertion
        (indent-region-custom 4) ; region was selected, call indent-region
        (insert "\t") ; else insert four spaces as expected
    )))
)

;; nice to have
;; e.g bind to ctrl-d
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)

;; requires xclip in PATH
(defun org-insert-image-clipboard ()
  (interactive)
  (setq imageName (concat "screenshot_" (format-time-string "%Y_%m_%d__%H_%M_%S") ".png"))
  (setq file (concat "~/.emacs.d/images/" imageName))
  (shell-command (concat "xclip -selection clipboard -t image/png -o > " file))
  (insert (concat "[[" file "]]"))
  (org-display-inline-images))

;; requires projectile package

(defun my-custom-grep ()
  "Custom grep function"
  (interactive)
  (let (s)
    (setq s (read-string "Search:"))
    (grep (format "grep --color -r -nH --null -e \"%s\" \"%s\" --include \\*.%s" s (projectile-project-root) (file-name-extension buffer-file-name)))
    ;; (message "Searching for %s in %s" s (projectile-project-root))
    )
  )

(defun my-custom-lgrep ()
  "Custom grep function"
  (interactive)
  (let (s)
    (setq s (read-string "Search:"))
    (grep (format "grep --color -nH --null -e \"%s\" * --include \\*.%s" s (file-name-extension buffer-file-name)))
    ;; (message "Searching for %s in %s" s (projectile-project-root))
    )
  )

;; bindings

; bind them to emacs's default shortcut keys:
;; (global-set-key (kbd "C-S-k") 'my-delete-line-backward) ; Ctrl+Shift+k
;; (global-set-key (kbd "C-k") 'my-delete-line)
;; (global-set-key (kbd "M-d") 'my-delete-word)
;; (global-set-key (kbd "<M-backspace>") 'my-backward-delete-word)
;; (global-set-key [(control w)] 'backward-kill-word)

(global-set-key [(control w)] 'my-backward-delete-word)
(define-key isearch-mode-map [(control f)] 'isearch-repeat-forward)

;; goto line number
(define-key global-map [?\s-g] 'goto-line) ;; alternatively use M-g g

;; paste image from clipboard using org mode
(global-set-key (kbd "C-x p") 'org-insert-image-clipboard)

(global-set-key (kbd "<backtab>") 'untab-region)
;; (global-set-key (kbd "<tab>") 'tab-region)
;; (global-set-key (kbd "C-d") 'duplicate-line)
;; (define-key c-mode-base-map (kbd "C-d") 'duplicate-line)
;; (global-set-key (kbd "C-a") 'mark-whole-buffer)

(global-set-key (kbd "C-j") 'my-custom-grep) ;; in hindsight could've just used projectile-grep
(global-set-key (kbd "C-l") 'my-custom-lgrep)
;; (global-set-key (kbd "C-l") 'projectile-grep)
(global-set-key (kbd "C-t") 'projectile-find-file)

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; some extra helpful stuff for replacing stuff

;; C-c p r runs the command projectile-replace

;; https://stackoverflow.com/questions/270930/using-emacs-to-recursively-find-and-replace-in-text-files-not-already-open
;; It's a more interactive method, and requires wgrep, rgrep and iedit. Both iedit and wgrep must be installed via MELPA or Marmalade (using M-x package-list-packages)
;; 
;; First run M-x rgrep to find the string you're looking for.
;; 
;; You'll be able to specify file types/pattern and the folder to recurse.
;; 
;; Next you'll need to run wgrep start it with C-s C-p.
;; 
;; Wgrep will let you edit the rgrep results, so set a region on the string to match and start iedit-mode with C-; (depending on your terminal you may need to re-bind this)
;; 
;; All occurrences will be editable at once. C-x C-s to commit wgrep. Then C-x s ! to save the changed files.
;; 
;; The main benefit of this method is that you can use iedit-mode to toggle off certain matches M-;. You can also use the results in rgrep to jump into the files, for example if you have an unexpected match.
;; 
;; I find it very useful for doing source edits and renaming symbols (variables, function names etc.) across a project.
;; 
;; If you don't already know/use iedit mode it's a very handy tool, I strongly recommend you give it a look.

;; https://stackoverflow.com/questions/23712076/how-to-remove-m-in-emacs/23712513
(defun delete-carrage-returns ()
  (interactive)
  (save-excursion
    (goto-char 0)
    (while (search-forward "\r" nil :noerror)
      (replace-match ""))))
