;; (require 'org-ref)

  (use-package org-bullets
    :custom
    (org-hide-leading-stars t)
    :hook org)

(require 'ox-latex)

(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass\[presentation\]\{beamer\}"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))

;; (require 'ox-html5slide)
;; getting a error, maybe wrong version...

(defun org-export-latex-no-toc (depth)
    (when depth
      (format "%% Org-mode is exporting headings to %s levels.\n"
              depth)))
(setq org-export-latex-format-toc-function 'org-export-latex-no-toc)

(add-to-list 'org-latex-classes
		   '("apa6"
			 "\\documentclass{apa6}"
			 ("\\section{%s}" . "\\section*{%s}")
			 ("\\subsection{%s}" . "\\subsection*{%s}")
			 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
			 ("\\paragraph{%s}" . "\\paragraph*{%s}")
			 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(setq org-latex-pdf-process
	  '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f"))

(with-eval-after-load 'org
(org-babel-do-load-languages 'org-babel-load-languages '((ruby . t)
(plantuml . t)
)))

;; For reference how to create diagram flow https://plantuml.com/activity-diagram-legacy
;; http://www.alvinsim.com/diagrams-with-plantuml-and-emacs/
;; https://lgfang.github.io/computer/2015/12/11/org-diagram

(setq org-plantuml-jar-path (expand-file-name "/usr/share/plantuml/plantuml.jar"))

(setq org-support-shift-select t)

(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))
(setq org-startup-with-inline-images t)
(setq org-image-actual-width 400)

(setq-default indent-tabs-mode nil)
(setq org-src-preserve-indentation t)
;; (setq org-edit-src-content-indentation 0)

(require 'org-download)

;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)
