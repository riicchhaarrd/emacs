;; Some useful shortcut reminders

;; Reload file
;; C-x C-v

;; Find command for key
;; C-h k

;; Comment / uncomment line
;; C-x C-;

;; Indent / clang-format region
;; C-M-\ (CTRL + ALT + \)

;; Building ctags or etags
;; etags -a $(ls *.[ch])

;; Move to other window
;; C-x o

;; Find out what key combination is used
;; M-x where-is <command>

;; Search and replace (query-replace)
;; M-% (Alt + Shift + 5)

;; Insert tab whilst in a code block in org mode
;; M-i (ALT + i)

;; Find references to function
;; M-?

;; Changing a code block in a temporary buffer in org mode
;; C-c '

;; Enable inline images in org mode
;; M-x org-toggle-inline-images RET or with the key-binding C-c C-x C-v.

;; Run code inside org mode
;; C-c C-c

;; Evaluate expression
;; c-u M-: (/ 100 (float 3)) RET

;; Begin of section

;; Useful links
;; https://orgmode.org/worg/org-tutorials/org-latex-export.html

;; Some LaTeX and org mode reminders / useful things

;; #+LaTeX_CLASS: article
;; to have superscripted references instead of [1]
;; #+LATEX_HEADER: \usepackage[superscript,biblabel]{cite}

;; use _CLASS instead
;; #+LATEX_HEADER: \documentclass{article}

;; TODO figure out how to use these, gives error when generating file
;; #+LATEX_HEADER: \usepackage{apacite}
;; #+LATEX_HEADER: \bibliographystyle{apacite}

;; Adding a reference to a website link

;; The Google Search engine\cite{google}
;; 
;; \begin{thebibliography}{1}
;; 
;; \bibitem{google}  \url{https://google.com}
;; 
;; \end{thebibliography}


;; End of section
