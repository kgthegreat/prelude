;; On OS X Emacs doesn't use the shell PATH if it's not started from
;; the shell.
;; If you're using homebrew or port, modifying the PATH is essential.
(let (osx-paths)
  (dolist (path '("/usr/local/bin" "/opt/local/bin" "/opt/local/sbin" "$HOME/bin")
                (setenv "PATH" (concat osx-paths (getenv "PATH"))))
    (push path exec-path)
    (setq osx-paths (concat (concat path ":") osx-paths))))

;; Emacs users obviously have little need for Command and Option keys,
;; but they do need Meta and Super
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)

(defun prelude-swap-meta-and-super ()
  "Swap the mapping of meta and super. Very useful for people using their Mac
with a Windows external keyboard from time to time."
  (interactive)
  (if (eq mac-command-modifier 'super)
      (progn
        (setq mac-command-modifier 'meta)
        (setq mac-option-modifier 'super)
        (message "Command is now bound to META and Option is bound to SUPER."))
    (progn
      (setq mac-command-modifier 'super)
      (setq mac-option-modifier 'meta)
      (message "Command is now bound to SUPER and Option is bound to META."))))

(define-key prelude-mode-map (kbd "C-c w") 'prelude-swap-meta-and-super)

(provide 'prelude-osx)
