;;; ack-automode.el -- Automode file types

;; Copyright (C) 2015-  Alberto Donato

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

;; Automode binding for file extensions.

;;; Code:

(require 'python)
(require 'yaml-mode)
(require 'js)
(require 'erc-log)
(require 'erc-view-log)

;; YAML files
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))
;; JavaScript files
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))
;; Twisted tac files
(add-to-list 'auto-mode-alist '("\\.tac$" . python-mode))
;; Zope files
(add-to-list 'auto-mode-alist '("\\.zcml$" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.pt$" . html-mode))
;; ERC log files
(add-to-list 'auto-mode-alist
             (cons (format "%s/\.*\\.txt$" (regexp-quote
                                            (expand-file-name erc-log-channels-directory)))
                   'erc-view-log-mode))

(provide 'ack-automode)

;;; ack-automode.el ends here

