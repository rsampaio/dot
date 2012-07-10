(add-to-list 'load-path "~/.libemacs/lib/")
(add-to-list 'load-path "~/.libemacs/lib/icicles")
(require 'bbdb)
(require 'icicles)
(require 'myemacs)
(require 'col-highlight)
(require 'myemacs)
(require 'uniquify)
(require 'fastnav)
(require 'python-mode)
(require 'ipython)
(require 'rainbow-delimiters)
(require 'org)
(require 'org-attach)
(require 'nyan-mode)
(require 'bookmark+)
(require 'thingatpt+)
(require 'files+)
(require 'dired+)
(require 'buff-menu+)

(fset 'yes-or-no-p 'y-or-n-p)

; (show-ws-toggle-show-hard-spaces)
; (show-ws-toggle-show-tabs)
; (show-ws-toggle-show-trailing-whitespace)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'sh-mode-hook 'my-sh-mode-hook)
(add-hook 'sgml-mode-hook 'my-sgml-mode-hook)
(add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
(add-hook 'org-mode-hook 'my-org-mode-hook)
(add-hook 'icicle-mode-hook 'my-icicle-mode-hook)
(add-hook 'js-mode-hook 'my-js-mode-hook)
(add-hook 'w3m-mode-hook 'my-w3m-mode-hook)
(add-hook 'python-mode-hook 'my-python-mode-hook)
(add-hook 'org-publish-before-export-hook 'my-org-publish-before-export-hook)
(add-hook 'org-publish-after-export-hook 'my-org-publish-after-export-hook)

(setq yow-file "~/.dot/dot.libemacs/shared/yow.lines")
(setq ssl-program-name "gnutls-cli")
(setq ssl-program-arguments '("--insecure" "--port" service "--x509cafile" "/etc/ssl/certs/ca-certificates.crt" host))
(setq-default indent-tabs-mode nil)
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq blink-matching-paren t)
(setq inhibit-startup-screen t)
(setq modeline-shadow-thickness 0)
(setq comment-multi-line t)
(setq mail-from-style 'angles)
(setq kill-whole-line t)
(setq uniquify-buffer-name-style 'post-forward)
(setq uniquify-strip-common-suffix nil)
(setq browse-url-browser-function 'w3m-browse-url)
(setq custom-file "~/.libemacs/custom.el")

(show-paren-mode t)
(size-indication-mode t)
(global-font-lock-mode t)
(global-linum-mode t)
(global-hl-line-mode)
(column-number-mode t)
(visual-line-mode t)
(transient-mark-mode nil)
(icy-mode t)
(my-x-as-term)
(nyan-mode)

(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(load "~/.libemacs/conf/keybindings.el")
(load "~/.libemacs/conf/autocomplete.el")
(load "~/.libemacs/conf/theme.el")
(load "~/.libemacs/conf/erc.el")
(load "~/.libemacs/conf/org.el")
(load "~/.libemacs/conf/yas.el")
(load "~/.libemacs/conf/movement.el")
(load "~/.libemacs/conf/wl.el")
(load "~/.libemacs/conf/dired.el")
(load "~/.libemacs/conf/epresent.el")
(load custom-file)
