(setq inhibit-splash-screen t)
    (mapc
     (lambda (pair)
       (if (eq (cdr pair) 'perl-mode)
           (setcdr pair 'cperl-mode)))
     (append auto-mode-alist interpreter-mode-alist))

    (setq auto-insert-directory (expand-file-name "~/.emacs_templates/"))
    (setq auto-insert-query nil) ;; don't ask, just do it.
    (define-auto-insert "\.pl\'" "autoinsert.pl")
    (define-auto-insert "\.sh\'" "autoinsert.sh")
    (add-hook 'find-file-hooks 'auto-insert)

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



(setq send-mail-function 'smtpmail-send-it)
(setq smtpmail-smtp-server "smtp.gmail.com")
(setq smtpmail-smtp-service 465)
(setq smtpmail-auth-credentials '(("smtp.gmail.com" 465 "ompnix@gmail.com" "Id3nt1ty")))
(setq smtpmail-starttls-credentials '(("smtp.gmail.com" 465 nil nil)))

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
(global-hl-line-mode 1)
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
(set-cursor-color "red")
(set-mouse-color "goldenrod")
;; Set region backgroung color
;;(set-face-background 'region "blue")
;; set emacs background color
 (set-background-color "grey")
