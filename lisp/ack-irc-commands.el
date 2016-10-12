;;; ack-irc-commands.el --- Custom IRC commands.

;;; Commentary:
;;;   Custom commands for ERC.

;;; Code:

(require 'erc)
(require 'subr-x)

(defmacro ack/def-erc-message-cmd (command description prefix)
  "Define an ERC COMMAND with a DESCRIPTION and PREFIX text."
  (let ((funcname (intern (concat "erc-cmd-" command))))
    `(defun ,funcname (&rest line)
     ,description
     (erc-send-message (concat ,prefix (string-join line " "))))))

(ack/def-erc-message-cmd "TABLEFLIP" "Flip table and send LINE." "(╯°□°）╯︵ ┻━┻ ")
(ack/def-erc-message-cmd "TABLERESET" "Reset table and send LINE." "┬──┬◡ﾉ(° -°ﾉ)")
(ack/def-erc-message-cmd "TARMAC" "Ask the bot to build tarmac job."
                         "sweetie: build tarmac now")
(ack/def-erc-message-cmd "BETA" "Send a message to members of beta squad"
                         "bogdana, tealeg, sparkiegeek, Ursinha")

(provide 'ack-irc-commands)
;;; ack-irc-commands.el ends here
