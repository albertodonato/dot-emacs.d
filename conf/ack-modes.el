;; ack-modes.el --- Modes configuration

;; Copyright (C) 2015  Alberto Donato

;; Author: Alberto Donato <alberto.donato@gmail.com>
;; Keywords: lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Modes loading and configuration.

;;; Code:

(require 'iso-transl) ;; For dead keys
(require 'multiple-cursors)
(require 'ox-reveal)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-hl-line-mode t)
(column-number-mode t)
(which-function-mode t)
(show-paren-mode t)
(winner-mode t)

;; ido-mode
(require 'ido)
(add-hook 'ido-mode-hook
          (progn
            (ido-mode t)
            (ido-everywhere t)
            (setq ido-enable-flex-matching t
                  ;; Display ido results vertically, rather than horizontally
                  ido-decorations '("\n " "" "\n " "\n   ..."
                                    "[" "]" " [No match]" " [Matched]"
                                    " [Not readable]" " [Too big]" " [Confirm]"))
            (defun ido-disable-line-trucation ()
              (set (make-local-variable 'truncate-lines) nil))
            (add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)))

;; full-ack
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)
(setq ack-executable "/usr/bin/ack-grep")
(setq ack-use-environment nil)

;; auto-complete
(require 'auto-complete-config)
(add-hook 'after-init-hook 'global-auto-complete-mode)
(ac-config-default)
(setq ac-comphist-file "~/.emacs-saves/auto-complete.dat")

;; jedi
(require 'jedi)
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'jedi-mode-hook '(lambda () (setq jedi:complete-on-dot t)))

;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook 'global-flycheck-mode)

;; python-mode
(require 'python)
(defun ack/python-setup ()
  "Configuration for `python-mode' load."
  (superword-mode 1)
  (setq
   python-shell-interpreter "ipython"
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
   python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"))
(add-hook 'python-mode-hook 'ack/python-setup)

;; smartparens-mode
(require 'smartparens)
(smartparens-global-mode)
(show-smartparens-global-mode t)
(require 'smartparens-config)
(setq sp-ignore-modes-list '(minibuffer-inactive-mode erc-mode fundametal-mode))

(require 'whitespace)
(autoload 'whitespace-toggle-options "whitespace" t)

(provide 'ack-modes)

;;; ack-modes.el ends here
