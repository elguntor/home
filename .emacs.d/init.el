(require 'package)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/"))
(defvar my-packages '(paredit ido-ubiquitous magit smex scpaste
                        evil evil-jumper evil-matchit evil-leader
                        helm powerline monokai-theme))
(package-initialize)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
(package-initialize)

;; hide the menu bar
(menu-bar-mode 0)
;; remap the Meta key to control-x control-m
(global-set-key "\C-x\C-m" 'execute-extended-command)
;; delete trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; mouse scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
;; line number separator
(setq linum-format "%d ")
(global-linum-mode t)
;;; shut magit up
(setq magit-last-seen-setup-instructions "1.4.0")
;;; turn on the debugger if an error happens on start
(setq debug-on-error t)
;;; powerline
(require 'powerline)
(powerline-default-theme)

;;; personal settings
;;; email address
(setq user-mail-address "elguntor@gmail.com")

;;; Calendar settings
;; you can use M-x sunrise-sunset to get the sun time
(setq calendar-latitude 43.7)
(setq calendar-longitude 79.4)
(setq calendar-location-name "Toronto, Canada")

;;; Time related settings
;; show time in 24hours format
(setq display-time-24hr-format t)
;; show time and date
(setq display-time-and-date t)
;; time change interval
(setq display-time-interval 10)
;; show time
(display-time-mode t)

;;; keybinding
(global-set-key (kbd "<f3>") 'list-buffers)

;;; helm
(require 'helm-config)
(helm-mode 1)
(setq helm-locate-fuzzy-match t)

;;; evil mode! - this has to come last in the load sequence
(require 'evil)
(evil-mode 1)

;;; evil-leader
(require 'evil-leader)
(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
 "e" 'find-file
 "b" 'switch-to-buffer
 "t" 'helm-find-files
 "k" 'kill-buffer)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d1dbd38c2fef808a27bb411ecff76a0a8026856a16cb2a1fb8820bedeb45740a" "0c49a9e22e333f260126e4a48539a7ad6e8209ddda13c0310c8811094295b3a3" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
