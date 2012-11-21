(global-set-key (kbd "C-c o") 'org-capture)
(global-set-key (kbd "C-c v") 'view-mode)
(global-set-key (kbd "C-c s") 'my-open-shell-sideways)
(global-set-key (kbd "C-c w") 'my-copy-line)
(global-set-key (kbd "C-c c") 'describe-char)
(global-set-key (kbd "C-S-o") 'my-prepend-line)
(global-set-key (kbd "C-c ,") 'icicle-tags-search)
(global-set-key (kbd "M-z") 'fastnav-zap-up-to-char-forward)
(global-set-key (kbd "M-Z") 'fastnav-zap-up-to-char-backward)
(global-set-key (kbd "C-M-.") 'icicle-find-file-in-tags-table)
(global-set-key (kbd "C-c j") 'fastnav-jump-to-char-forward)
(global-set-key (kbd "C-c J") 'fastnav-jump-to-char-backward)
(global-set-key (kbd "C-c U") 'browse-url-at-point)
(global-set-key (kbd "C-c u") 'browse-url)
(global-set-key (kbd "C-o") 'my-append-line)
(global-set-key (kbd "<f5>") 'ispell-change-dictionary)
(global-set-key (kbd "C-x D") 'find-name-dired)
(global-set-key (kbd "S-<f5>") 'my-toggle-flyspell)
(global-set-key (kbd "<f6>") 'column-highlight-mode)
(global-set-key (kbd "S-<f6>") 'whitespace-mode)
(global-set-key (kbd "<f7>") 'visual-line-mode)
(global-set-key (kbd "S-<f7>") 'toggle-truncate-lines)
(global-set-key (kbd "S-<f8>") 'compile)
(global-set-key (kbd "<f8>") 'magit-status)
(global-set-key (kbd "<f9>") 'speedbar)
(global-set-key (kbd "C-k") 'kill-whole-line)
(global-set-key (kbd "C-S-k") 'kill-line)
(global-set-key (kbd "C-c C-SPC 0") 'erc-track-switch-buffer)
(global-set-key (kbd "C-c C-SPC 1") '(lambda () (interactive) (wl-summary-goto-folder-subr "%inbox:\"dsouza@bitforest.org\"/clear@imap.gmail.com:993!" "update" nil nil t nil nil)))
(global-set-key (kbd "C-c C-SPC 2") '(lambda () (interactive) (wl-summary-goto-folder-subr "%inbox:\"diego.souza\"/clear@outlook.locaweb.com.br:993!" "update" nil nil t nil nil)))
(global-set-key (kbd "C-c C-SPC 9") '(lambda () (interactive) (wl-folder-goto-draft-folder)))
(global-set-key (kbd "M-<up>") 'scroll-down)
(global-set-key (kbd "M-<down>") 'scroll-up)
(global-set-key (kbd "M-<right>") 'move-end-of-line)
(global-set-key (kbd "M-<left>") 'move-beginning-of-line)
(global-set-key (kbd "C-c 0") (my-recursive-edit-preserving-window-config (my-recursive-edit-without-this-window)))
(global-set-key (kbd "C-c 1") (my-recursive-edit-preserving-window-config (my-recursive-edit-with-single-window)))

