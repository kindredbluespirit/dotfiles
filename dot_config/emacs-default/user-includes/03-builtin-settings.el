;; remove all the bars that take up precious real estate on the screen
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; customize
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; treat files the way vscode does
(setq find-file-visit-truename t)

;; gnus
(setq gnus-home-directory user-emacs-directory)
(setq gnus-save-newsrc-file nil)

;; erc
(setq erc-nick prefix)

;; rcirc
(setq rcirc-default-nick prefix)

;; do not create the annoying backup files named "<filename>~"
(setq make-backup-files nil)

;; disable the beep (similar to the syscons bell)
(setq ring-bell-function 'ignore)

;; focus follows mouse or shift+arrows
(setq mouse-autoselect-window t)
(windmove-default-keybindings)

;; font
;; (set-default-font "Noto Sans Mono:pixelsize=20")
(add-to-list 'default-frame-alist '(font . "NotoSansMono-12"))

;; relative line number
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; newsticker
(setq newsticker-url-list '(
  ("pine64" "https://www.pine64.org/feed/" nil nil nil)
  ("archlinux news" "https://www.archlinux.org/feeds/news/" nil nil nil)
  ("gentoo news" "https://www.gentoo.org/feeds/news.xml" nil nil nil)
  ("freebsd news" "https://www.freebsd.org/news/rss.xml" nil nil nil)
  ("gitlab" (concat "https://gitlab.com/" (getenv "IDENTITY") ".atom?feed_token=TU6XPuZv59JrVwzxsHPy") nil nil nil)
  ("suckless" "https://suckless.org/atom.xml" nil nil nil)))
;; (setq newsticker-groups (list "Feeds"))
(setq-neo newsticker-reddit-list '(
  "EnoughMuskSpam"
  "piracy"
  "fossdroid"
  "VFIO"))
(setq newsticker-url-list (append
  (mapcar 
    (lambda (x) (list (concat "r/" x) (concat "https://www.reddit.com/r/" x ".rss") nil nil nil))
    (evalq-neo newsticker-reddit-list))
  newsticker-url-list))
;; (setq newsticker-groups (append
;;   newsticker-groups
;;   (add-to-list 
;;     (mapcar 
;;       (lambda (x) (list (concat "r/" x) (concat "https://www.reddit.com/r/" x ".rss")))
;;       (evalq-neo newsticker-reddit-list)) 
;;     "reddit")))

(provide '03-builtin-settings)