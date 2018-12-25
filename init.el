
(menu-bar-mode -1)

(tool-bar-mode -1)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
;;Auto Indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;;Line Numbers
(global-linum-mode 1)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var" "share")))))
 (when (and opam-share (file-directory-p opam-share))
  (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
  (autoload 'merlin-mode "merlin" nil t nil)
  (add-hook 'tuareg-mode-hook 'merlin-mode t)
  (add-hook 'caml-mode-hook 'merlin-mode t)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (misterioso)))
 '(frame-background-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;(load-theme 'monokai t)

(setq monokai-height-minus-1 0.8
      monokai-height-plus-1 1.1
      monokai-height-plus-2 1.15
      monokai-height-plus-3 1.2
      monokai-height-plus-4 1.3)

(setq ;; foreground and background
      monokai-foreground     "#ABB2BF"
      monokai-background     "#282C34"
      ;; highlights and comments
      monokai-comments       "#F8F8F0"
      monokai-emphasis       "#282C34"
      monokai-highlight      "#FFB269"
      monokai-highlight-alt  "#66D9EF"
      monokai-highlight-line "#1B1D1E"
      monokai-line-number    "#F8F8F0"
      ;; colours
      monokai-blue           "#61AFEF"
      monokai-cyan           "#56B6C2"
      monokai-green          "#98C379"
      monokai-gray           "#3E4451"
      monokai-violet         "#C678DD"
      monokai-red            "#E06C75"
      monokai-orange         "#D19A66"
      monokai-yellow         "#E5C07B")
