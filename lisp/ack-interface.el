;;; ack-interface.el -- Interface configuration

;;; Commentary:
;;;   General configuration for interface and intaractions.

;;; Code:

(setq-default scroll-conservatively 5
              fill-column 79
              tab-width 4
              indent-tabs-mode nil)
(setq browse-url-browser-function 'browse-url-default-browser
      ;; use UTF-8 when pasting
      x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)
      ;; don't let the cursor go into minibuffer prompt
      minibuffer-prompt-properties '(read-only t point-entered minibuffer-avoid-prompt face minibuffer-prompt))

;; use y/n to answer questions
(fset 'yes-or-no-p 'y-or-n-p)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-defun 'disabled nil)
(put 'narrow-to-page   'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; better unique naming for buffers
(use-package uniquify
  :ensure nil)

;; support dead keys
(use-package iso-transl
  :ensure nil)

(use-package dired
  :ensure nil
  :bind (:map dired-mode-map
              ("C-c C-q" . wdired-change-to-wdired-mode)
              ("C-<right>" . dired-subtree-insert)
              ("C-<left>" . dired-subtree-remove))
  :config
  (use-package dired-x
    :ensure nil)
  (use-package dired-subtree
    :ensure nil))

(use-package ido
  :config
  (ido-mode t)
  (ido-everywhere t)
  (setq ido-enable-flex-matching t
        ido-save-directory-list-file (ack/in-cache-dir "ido.last")
        ;; Display ido results vertically, rather than horizontally
        ido-decorations '("\n " "" "\n " "\n   ..."
                          "[" "]" " [No match]" " [Matched]"
                          " [Not readable]" " [Too big]" " [Confirm]")))

(use-package flx-ido
  :after (ido)
  :config
  (flx-ido-mode 1)
  (setq flx-ido-use-faces nil))

(use-package hl-line
  :ensure nil
  :hook ((after-init . global-hl-line-mode)))

(use-package linum-mode
  :ensure nil
  :bind (("C-c n" . linum-mode)))

(use-package paren
  :ensure nil
  :hook ((after-init . show-paren-mode)))

(use-package simple
  :ensure nil
  :hook ((after-init . column-number-mode)))

(use-package smex
  :hook ((after-init . smex-initialize))
  :bind ("M-x" . smex)
  :config
  (setq smex-save-file (ack/in-cache-dir "smex-items")))

(use-package winner
  :ensure nil
  :hook (after-init . winner-mode))

(use-package which-func
  :ensure nil
  :config
  (which-function-mode t))

(provide 'ack-interface)
;;; ack-interface.el ends here
