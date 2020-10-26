
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(setq byte-compile-warnings '(cl-functions))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(muse-project-alist nil)
 '(package-selected-packages '(org-roam ## js2-mode rust-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq org-roam-directory "~/github/org-roam")

(add-hook 'after-init-hook 'org-roam-mode)
(setq org-roam-tag-sources '(prop last-directory))

(require 'org-roam-protocol)

(make-org-roam-doctor-checker
 :name 'org-roam-doctor-broken-links
 :description "Fix broken links."
 :actions '(("d" . ("Unlink" . org-roam-doctor--remove-link))
	    ("r" . ("Replace link" . org-roam-doctor--replace-link))
	                   ("R" . ("Replace link (keep label)" . org-roam-doctor--replace-link-keep-label))))
(setq org-roam-db-gc-threshold most-positive-fixnum)

;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)


