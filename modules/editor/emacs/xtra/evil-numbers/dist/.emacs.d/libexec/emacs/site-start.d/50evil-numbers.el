; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'evil-numbers)
  (package-install 'evil-numbers))

(require 'evil-numbers)

(global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)
