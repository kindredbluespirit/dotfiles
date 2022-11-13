;; melpa (all external packages go after this block)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
;; (package-refresh-contents t)

;; ;; evil mode
;; (unless (package-installed-p 'evil)
;;   (package-install 'evil))
;; (require 'evil)
;; (evil-mode 1)


;; (require 'use-package)

;; ;; vscode dark theme
;; (use-package vscode-dark-plus-theme
;;   :ensure t
;;   :config
;;   (load-theme 'vscode-dark-plus t))

;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   ;; Global settings (defaults)
;;   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;         doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;   (load-theme 'doom-one t)

;;   ;; Enable flashing mode-line on errors
;;   (doom-themes-visual-bell-config)
;;   ;; Enable custom neotree theme (all-the-icons must be installed!)
;;   (doom-themes-neotree-config)
;;   ;; or for treemacs users
;;   (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
;;   (doom-themes-treemacs-config)
;;   ;; Corrects (and improves) org-mode's native fontification.
;;   (doom-themes-org-config))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; manual management (backup in case melpa gives any trouble)

;; evil-mode
(add-to-list 'load-path (concat user-emacs-directory "evil"))
(require 'evil)
(evil-mode 1)

;; set theme
(add-to-list 'custom-theme-load-path (concat user-emacs-directory "themes"))
(load-theme 'vscode-dark-plus t)

;; ;; doom emacs themes
;; (add-to-list 'custom-theme-load-path (concat user-emacs-directory "emacs-doom-themes/themes"))

;; simpleclip
(add-to-list 'load-path (concat user-emacs-directory "simpleclip"))
(require 'simpleclip)
(simpleclip-mode 1)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(provide '04-external-packages)