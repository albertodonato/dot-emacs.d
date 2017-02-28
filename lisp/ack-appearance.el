;;; ack-appearance.el --- Appearance settings

;;; Commentary:
;;;   Appearance and themes settings.

;;; Code:

(setq inhibit-startup-message t
      initial-scratch-message nil
      inhibit-startup-echo-area-message t)

(setq initial-frame-alist '((fullscreen . maximized)))
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; display Emacs version and buffer name in window title
(setq frame-title-format
      '("Emacs " emacs-version ": "
        (:eval (if (buffer-file-name) (abbreviate-file-name (buffer-file-name)) "%b"))))

(setq-default indicate-empty-lines t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(winner-mode t)

(global-font-lock-mode t)
(global-hl-line-mode t)
(column-number-mode t)
(which-function-mode t)
(show-paren-mode t)

;; themes configuration
(require 'color-theme)
(require 'color-theme-solarized)

(setq custom-theme-directory (concat user-emacs-directory "themes")
      custom-safe-themes t
      frame-background-mode 'dark)

(load-theme 'ack t)
(load-theme 'ack-common t)

(provide 'ack-appearance)
;;; ack-appearance.el ends here
