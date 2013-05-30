;; hide the menu bar
(menu-bar-mode 0)
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
;; delete trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; remap the Meta key to control-x control-m
;;(global-set-key "\C-x\C-m" 'execute-extended-command)

;; remap backward kill word
;; (global-set-key "\C-w" 'backward-kill-word)

;; remap kill region
(global-set-key "\C-x\C-k" 'kill-region)
;; set the default indentation to tabs
;;(set-default 'indent-tabs-mode t)
;; set the ruby tab indent to 8
;;(setq ruby-indent-level 8)
;;(add-hook 'ruby-mode-hook (lambda () (setq indent-tabs-mode t)))
;; prevent emacs from making backup files
;;(setq make-backup-files nil)

;; disable highlighting installed by the emacs starter kit
(remove-hook 'coding-hook 'turn-on-hl-line-mode)
(remove-hook 'coding-hook 'esk-turn-on-idle-highlight-mode)
(setq backup-by-copying t)

(defun duplicate-line-or-region (&optional n)
  "Duplicate current line, or region if active.
With argument N, make N copies.
With negative N, comment out original line and use the absolute value."
  (interactive "*p")
  (let ((use-region (use-region-p)))
    (save-excursion
            (let ((text (if use-region        ;Get region if active,
                                        ;otherwise line
                            (buffer-substring (region-beginning) (region-end))
                          (prog1 (thing-at-point 'line)
                            (end-of-line)
                            (if (< 0 (forward-line 1)) ;Go to beginning of next line, or make a new one
                                (newline))))))
                      (dotimes (i (abs (or n 1)))     ;Insert N times,
                                        ;or once if not specified
                        (insert text))))
        (if use-region nil                  ;Only if we're working
                                        ;with a line (not a region)
          (let ((pos (- (point) (line-beginning-position)))) ;Save column
                    (if (> 0 n)                             ;Comment
                                        ;out original with negative
                                     ;arg
                        (comment-region (line-beginning-position) (line-end-position)))
                    (forward-line 1)
                    (forward-char pos)))))
(global-set-key [?\C-c ?d] 'duplicate-line-or-region)
(provide 'marshall);;;
