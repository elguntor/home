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
(global-set-key "\C-x\C-m" 'execute-extended-command)
;; remap backward kill word
;; (global-set-key "\C-w" 'backward-kill-word)
;; remap kill region
(global-set-key "\C-x\C-k" 'kill-region)
;; set the default indentation to tabs
(set-default 'indent-tabs-mode t)
;; set the ruby tab indent to 8
(setq ruby-indent-level 8)
(add-hook 'ruby-mode-hook (lambda () (setq indent-tabs-mode t)))
;; prevent emacs from making backup files
(setq make-backup-files nil)