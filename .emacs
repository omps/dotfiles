;; -*- mode: elisp -*-
;; setting up load-path and include all the subdirectories within.
(add-to-list 'load-path "~/.emacs.d/")
;;(let ((default-directory "~/emacs.d/"))
;;  (normal-top-level-add-subdirs-to-load-path)

(setq inhibit-splash-screen t)
(require `color-theme)
(color-theme-initialize)
(color-theme-subtle-hacker)
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


(defun php-template-if ()
  "Insert an if statement."
  (interactive)
  (let ((start (point)))
    (insert "if ")
    (insert "(") ; +
    (when (php-template-field "condition" nil t start (point))
      (insert ") {") ; +
      (newline-and-indent)
      (setq start (point-marker))
      (insert "\n}")
      (php-indent-line-2)
      (goto-char start))))

;; cperl customizaiton
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(cperl-array-face ((t (:foreground "green" :weight bold))))
 '(cperl-hash-face ((t (:foreground "Red" :slant italic :weight bold)))))
;; MY mail customizations
;; (setq send-mail-function 'smtpmail-send-it)
;; (setq smtpmail-smtp-server "smtp.gmail.com")
;; (setq smtpmail-smtp-service 465)
;; (setq smtpmail-auth-credentials '(("smtp.gmail.com" 465 "ompnix@gmail.com" "secret")))
;; (setq smtpmail-starttls-credentials '(("smtp.gmail.com" 465 nil nil)))
;; Fetching mails with fetchmail.
;; (defun fetchmail ()
;;       "First polls server with fetchmail -c and reports status,
;;      then offers to run fetchmail without any switches."
;;       (interactive)
;;       (message "checking for mail...")
;;       (let ((check (shell-command-to-string "fetchmail -c")))
;;         (if (y-or-n-p
;;              (concat
;;               (cond ((string-match "failed" check) "failed to poll server")
;;                     ((string-match "No mail" check) "no messages to fetch")
;;                     ((string-match "message" check)
;;                      (concat
;;                       (substring check 0 (string-match " " check))
;;                       " messages to fetch "
;;                       (substring check
;;                                  (string-match "(" check)
;;                                  (+ 1 (string-match ")" check)))))
;;                     (t "terribly confused"))
;;               " - run fetchmail? "))
;;             (progn (message "Running fetchmail...")
;;                    (let ((error-code (call-process "fetchmail")))
;;                      (message
;;                       (concat "Running fetchmail... "
;;                               (cond ((eq error-code 0) "got mail")
;;                                     ((eq error-code 1) "no mail")
;;                                     (t "some kind of error occurred"))))))
;;           (message nil))))

;; Fetching gmails with emacs refer .gnus



;; setting up cperl mode at startup.
(add-hook 'perl-mode-hook '(lambda () (local-set-key [f7] 'compile)))
(defun perl-eval () "Run selected region as Perl code" (interactive)
   (shell-command-on-region (mark) (point) "perl "))
(global-set-key (kbd "<f7>") 'perl-eval)

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
;; set cursor and mouse pointer colors
(set-cursor-color "purple")
(set-mouse-color "goldenrod")
;; Set region backgroung color
(set-face-background 'region "light blue")
;; set emacs background color
(set-background-color "black")
(set-foreground-color "white")
(set-face-foreground 'modeline "firebrick")
;; Org-mode settings
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-font-lock-mode 1)
;; Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Custom Key Bindings
(global-set-key (kbd "<f12>") 'org-agenda)
(global-set-key (kbd "<f5>") 'bh/org-todo)
(global-set-key (kbd "<S-f5>") 'bh/widen)
(global-set-key (kbd "<f7>") 'bh/set-truncate-lines)
(global-set-key (kbd "<f8>") 'org-cycle-agenda-files)
(global-set-key (kbd "<f9> <f9>") 'bh/show-org-agenda)
(global-set-key (kbd "<f9> b") 'bbdb)
(global-set-key (kbd "<f9> c") 'calendar)
(global-set-key (kbd "<f9> f") 'boxquote-insert-file)
(global-set-key (kbd "<f9> g") 'gnus)
(global-set-key (kbd "<f9> h") 'bh/hide-other)
(global-set-key (kbd "<f9> n") 'org-narrow-to-subtree)
(global-set-key (kbd "<f9> w") 'widen)
(global-set-key (kbd "<f9> u") 'bh/narrow-up-one-level)

(global-set-key (kbd "<f9> I") 'bh/punch-in)
(global-set-key (kbd "<f9> O") 'bh/punch-out)

(global-set-key (kbd "<f9> o") 'bh/make-org-scratch)

(global-set-key (kbd "<f9> r") 'boxquote-region)
(global-set-key (kbd "<f9> s") 'bh/switch-to-scratch)

(global-set-key (kbd "<f9> t") 'bh/insert-inactive-timestamp)
(global-set-key (kbd "<f9> T") 'tabify)
(global-set-key (kbd "<f9> U") 'untabify)

(global-set-key (kbd "<f9> v") 'visible-mode)
(global-set-key (kbd "<f9> SPC") 'bh/clock-in-last-task)
(global-set-key (kbd "C-<f9>") 'previous-buffer)
(global-set-key (kbd "M-<f9>") 'org-toggle-inline-images)
(global-set-key (kbd "C-x n r") 'narrow-to-region)
(global-set-key (kbd "C-<f10>") 'next-buffer)
(global-set-key (kbd "<f11>") 'org-clock-goto)
(global-set-key (kbd "C-<f11>") 'org-clock-in)
(global-set-key (kbd "C-s-<f12>") 'bh/save-then-publish)
(global-set-key (kbd "C-M-r") 'org-capture)
(global-set-key (kbd "C-c r") 'org-capture)

(defun bh/hide-other ()
  (interactive)
  (save-excursion
    (org-back-to-heading 'invisible-ok)
    (hide-other)
    (org-cycle)
    (org-cycle)
    (org-cycle)))

(defun bh/set-truncate-lines ()
  "Toggle value of truncate-lines and refresh window display."
  (interactive)
  (setq truncate-lines (not truncate-lines))
  ;; now refresh window display (an idiom from simple.el):
  (save-excursion
    (set-window-start (selected-window)
                      (window-start (selected-window)))))

(defun bh/make-org-scratch ()
  (interactive)
  (find-file "/tmp/publish/scratch.org")
  (gnus-make-directory "/tmp/publish"))

(defun bh/switch-to-scratch ()
  (interactive)
  (switch-to-buffer "*scratch*"))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-use-system-font t)
 '(org-agenda-files (quote ("~/todo/personaltodo.org")))
 '(weblogger-config-alist (quote (("default" "http://omps.wordpress.com/xmlrpc.php" "omps" "" "733713")))))
(set-face-foreground 'minibuffer-prompt "white")
;; if you want to be notified by activity in channels.
(rcirc-track-minor-mode 1) ; use C-c C-<SPC> to switch buffers.

;; enabling erc
(require 'erc)

;; weblogger settings
(require 'weblogger)

;; simplenote.el
(require 'simplenote)

;; twittering mode
(add-to-list 'load-path "~/.emacs.d/twittering-mode/")
(require 'twittering-mode)
(setq twittering-use-master-password t)
(setq twittering-cert-file "/etc/ssl/certs/ca-certificates.crt") ;; need to ensure this path is correct. It didn't worked the firs time.

;; setting up templates.
(add-to-list 'load-path "~/.emacs.d/template/")