;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles

;; always end a file with a newline
;(setq require-final-newline 'query)

;; Turn off mouse interface early in startup to avoid momentary display
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Write backup files to own directory

;; Make backups of files, even when they're in version control

;; Package Archives
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives 
	       '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/"))
  (package-initialize))

;; Matlab
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.m$" . matlab-mode))

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)

;; Diminish modeline clutter
(require 'diminish)
;(diminish 'wrap-region-mode)
;(diminish 'yas/minor-mode)

(global-set-key (kbd "C-x g") 'webjump)

;; Add Urban Dictionary to webjump
(eval-after-load "webjump"
  '(add-to-list 'webjump-sites
		'("Urban Dictionary" .
		  [simple-query
		   "www.urbandictionary.com"
		   "http://www.urbandictionary.com/define.php?term="
		   ""])))

;; ess: Emacs Speaks Statistics
(require 'ess-site)

;; cedet
(global-ede-mode 1)
(semantic-mode 1)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-mru-bookmark-mode)
(add-to-list 'semantic-default-submodes 'global-semanticdb-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-idle-scheduler-mode)
;(add-to-list 'semantic-default-submodes 'global-semantic-stickyfunc-mode)
;(add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode)
(add-to-list 'semantic-default-submodes 'global-semantic-highlight-func-mode)
(defun nchen/c-mode-cedet-hook ()
	(local-set-key "." 'semantic-complete-self-insert)
	(local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)

  (add-to-list 'ac-sources 'ac-source-gtags)
  )
(add-hook 'c-mode-common-hook 'nchen/c-mode-cedet-hook)

;; autocomplete
;(require 'auto-complete-config)
;(global-auto-complete-mode t)

;; company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; color themes
;;(require 'zenburn-theme);;bubbleberry-theme)
(load-theme 'solarized-dark t)

;;visual-basic-mode
;; autoload visual-basic-mode
(autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
(add-to-list 'auto-mode-alist '("\\.vbs\\'" . visual-basic-mode)) ; VBscript
(add-to-list 'auto-mode-alist '("\\.vb\\'" . visual-basic-mode))  ; visual basic .NET file
(add-to-list 'auto-mode-alist '("\\.bas\\'" . visual-basic-mode)) ; visual basic form
(add-to-list 'auto-mode-alist '("\\.frm\\'" . visual-basic-mode)) ; basic language source
(add-to-list 'auto-mode-alist '("\\.cls\\'" . visual-basic-mode)) ; C++ class definition file

;; rainbow-delimiters
(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)
(setq show-paren-style 'expression)
;; fix
(defvar ac-sources nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-engine (quote luatex))
 '(backup-directory-alist
	 (\`
		(("." \,
			(expand-file-name
			 (concat user-emacs-directory "backups"))))))
 '(custom-safe-themes
	 (quote
		("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(default-tab-width 2 t)
 '(diff-switches "-u")
 '(frame-title-format (concat "%b - emacs@" (system-name)) t)
 '(indent-tabs-mode t)
 '(inhibit-startup-screen t)
 '(matlab-indent-function t)
 '(matlab-shell-command "matlab")
 '(save-place-file (expand-file-name ".places" user-emacs-directory))
 '(vc-make-backup-files t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
