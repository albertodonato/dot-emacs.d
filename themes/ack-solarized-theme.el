;;; ack-solarized-theme-el --- Additional customization over the solarized theme.

;;; Commentary:
;;;   My changes on top of the solarized dark theme.

;;; Code:

(deftheme ack-solarized "Customizations for solarized theme.")

(custom-theme-set-faces
 'ack-solarized
'(error ((t (:foreground "Red1" :inverse-video nil))))
'(diff-file-header ((t (:background nil))))
 '(diff-added ((t (:background nil))))
 '(diff-removed ((t (:background nil))))

 '(jedi:highlight-function-argument ((t (:foreground "#2aa198"))))
 )

(provide-theme 'ack-solarized)
;;; ack-solarized-theme.el ends here
