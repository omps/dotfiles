;; -*- mode: elisp -*-

;; FOR LISTING ORG REPOSTIORIES
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)
(setq url-http-attempt-keepalives nil)

;; setting up load-path and include all the subdirectories within.
(add-to-list 'load-path "~/.emacs.d/")
;;(let ((default-directory "~/emacs.d/"))
;;  (normal-top-level-add-subdirs-to-load-path)

(setq inhibit-splash-screen t)
(require `color-theme)
(color-theme-initialize)
;;(color-theme-subtle-hacker)
    (mapc
     (lambda (pair)
       (if (eq (cdr pair) 'perl-mode)
           (setcdr pair 'cperl-mode)))
     (append auto-mode-alist interpreter-mode-alist))

    (auto-insert-mode)
    (setq auto-insert-directory "~/.emacs_templates/")
    (setq auto-insert-query nil) ;; don't ask, just do it.
    (define-auto-insert "\.pl'" "autoinsert.pl")
    (define-auto-insert "\.sh'" "autoinsert.sh")
;;    (add-hook 'find-file-hooks 'auto-insert)


;; setting up cperl mode at startup.
(add-hook 'perl-mode-hook '(lambda () (local-set-key [f7] 'compile)))
(defun perl-eval () "Run selected region as Perl code" (interactive)
   (shell-command-on-region (mark) (point) "perl "))

;; I am enaling IDO mode here
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
  (ido-mode 1)
  (global-set-key "\C-x\C-b" 'ibuffer)

;; Enable line number mode here
(global-linum-mode 1)
(setq linum-format "%d ")
(global-hl-line-mode -1)
(set-face-background 'hl-line "black")

;;Automatically load abbrevation table 
(setq-default abbrev-mode t)
(read-abbrev-file "~/.abbrev_defs")
(setq save-abbrevs t)

;; Set standard indent size
(setq standard-indent 2)

;; Line by line scrolling
(setq scroll-step 1)
;; prevent backup file creation
;;(setq make-backup-file nil)
;; Saving backupfiles to a different directory.
(setq make-backup-files t)
;; Enable version system
(setq version-control t)
;; Save all backup files in this directory
(setq backup-directory-alist (quote ((".*" . "~/.emacs_backup"))))
;; automatic wrapping of files
(setq auto-fill-mode 1)
;; Set text as the default mode
(setq default-major-mode 'text-mode)
;; Org-mode settings
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-font-lock-mode 1)
;; Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(font-use-system-font t)
 '(org-agenda-files (quote ("~/todo/personaltodo.org" "~/todo/daily-timetable.org" "~/notes/personal.org" "~/notes/tips.org")))
 '(org2blog/wp-blog-alist (quote (("my-blog" :url "http://singhom.com/~omps/wordpress/xmlrpc.php" :username (netrc-get blog "login") :password (netrc-get blog "password")))) t)
 '(weblogger-config-alist (quote (("default" "http://singhom.com/~omps/wordpress/xmlrpc.php" "admin" "" "1")))))
(set-face-foreground 'minibuffer-prompt "white")
;; if you want to be notified by activity in channels.
(rcirc-track-minor-mode 1) ; use C-c C-<SPC> to switch buffers.

;; enabling erc
(require 'erc)

;; weblogger settings
(require 'weblogger)
(require 'xml-rpc)
(setq load-path (cons "~/.emacs.d/metaweblog/" load-path))
(require 'metaweblog)

(setq load-path (cons "~/.emacs.d/org2blog/" load-path))
(require 'org2blog-autoloads)
(setq org2blog/wp-blog-alist
       '(("wordpress"
          :url "http://omps.wordpress.com/xmlrpc.php"
          :username "omps"
          :default-title "Hello World"
          :default-categories ("org2blog" "emacs")
          :tags-as-categories nil)
         ("my-blog"
          :url "http://singhom/~omps/wordpress/xmlrpc.php"
          :username "admin")))

;; simplenote.el
(require 'simplenote)

;; twittering mode
(add-to-list 'load-path "~/.emacs.d/twittering-mode/")
(require 'twittering-mode)
(setq twittering-use-master-password t)
(setq twittering-cert-file "/etc/ssl/certs/ca-certificates.crt") ;; need to ensure this path is correct. It didn't worked the firs time.

;; setting up templates.
(add-to-list 'load-path "~/.emacs.d/template/")

;; tramp
(require 'tramp)

;; auto-complete
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
