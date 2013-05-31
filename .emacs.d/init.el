(require 'package)
(add-to-list 'package-archives
	     '("melpa" .
               "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(add-hook 'after-init-hook #'global-flycheck-mode)
