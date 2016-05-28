;;; ack-interactive.el --- Interactive commands

;;; Commentary:
;;;   Interactive commands.

;;; Code:

(defun sudo ()
  "Use TRAMP to `sudo' the current buffer."
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@localhost:" buffer-file-name))))

(defun ack/kill-all-file-buffers ()
  "Kill all buffers that visit a file."
  (interactive)
  (mapc
   (lambda (buf) (when (buffer-file-name buf) (kill-buffer buf)))
   (buffer-list)))

(defun ack/shell-command-on-region-replace (command)
  "Execute COMMAND with region as input and replace it with output."
  (interactive "sShell command: ")
  (shell-command-on-region (region-beginning) (region-end) command t t))

(defun ack/python-insert-pdb-statement ()
  "Insert pdb statement on the line at point."
  (interactive)
    (ack/insert-text-and-reindent "import pdb; pdb.set_trace()"))

(defun ack/insert-text-and-reindent (text)
  "Insert TEXT on a new line at point and reindent."
  (interactive)
  (let ((beg (line-beginning-position)))
    (beginning-of-line)
    (insert (concat text "\n"))
    (indent-region beg (line-end-position))))

(defun ack/ag-compile-goto-error-and-kill-search-buffer ()
  "Jump to the error at point and kill the search buffer."
  (interactive)
  (let ((buf (current-buffer)))
    (compile-goto-error)
    (kill-buffer buf)))

(provide 'ack-interactive)
;;; ack-interactive.el ends here
