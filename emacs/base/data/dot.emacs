; -*- mode: emacs-lisp; -*-

(let ((user-site-lisp-dir (concat user-emacs-directory "share/emacs/site-lisp/"))
      (user-theme-dir (concat user-emacs-directory "themes/"))
      (user-site-start-dir (concat user-emacs-directory "libexec/emacs/site-start.d/")))
  (add-to-list 'custom-theme-load-path user-theme-dir)
  (let ((default-directory user-site-lisp-dir))
    (normal-top-level-add-to-load-path '("."))
    (normal-top-level-add-subdirs-to-load-path))
  (mapcar 'load (file-expand-wildcards (concat user-site-start-dir "*.el"))))

(require 'server)

(set-default-font "DejaVu Sans Mono")

(fset 'yes-or-no-p 'y-or-n-p)

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
(setq custom-file "~/.emacs.d/custom-file")

(put 'erase-buffer 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

(load custom-file)

(show-paren-mode t)
(size-indication-mode t)
(global-font-lock-mode t)
(global-linum-mode t)
(global-hl-line-mode)
(column-number-mode t)
(visual-line-mode t)
(transient-mark-mode -1)
(unless (server-running-p) (server-start))