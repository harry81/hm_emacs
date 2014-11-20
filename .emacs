(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
))
(package-initialize)
(setq url-http-attempt-keepalives nil)

(load "~/.emacs.d/hm_custom")
(load "~/.emacs.d/hm_common")
(load "~/.emacs.d/hm_common_key")
(load "~/.emacs.d/hm_appearance")
;;(load "~/.emacs.d/hm_ecb")
(load "~/.emacs.d/hm_development")
;;(load "~/.emacs.d/hm_ide")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes (quote ("b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ecb-options-version "2.32")
 '(flymake-allowed-file-name-masks (quote (("\\.py\\'" flymake-pycodecheck-init nil nil) ("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'" flymake-simple-make-init nil nil) ("\\.xml\\'" flymake-xml-init nil nil) ("\\.html?\\'" flymake-xml-init nil nil) ("\\.cs\\'" flymake-simple-make-init nil nil) ("\\.p[ml]\\'" flymake-perl-init nil nil) ("\\.php[345]?\\'" flymake-php-init nil nil) ("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup nil) ("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup nil) ("\\.tex\\'" flymake-simple-tex-init nil nil) ("\\.idl\\'" flymake-simple-make-init nil nil))))
 '(gnus-secondary-select-method nil)
 '(gnus-select-method (quote (nnml "")))
 '(grep-find-ignored-directories (quote ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "migrations")))
 '(inhibit-startup-buffer-menu t)
 '(inhibit-startup-screen t)
 '(jedi:setup-keys t)
 '(js-indent-level 2)
 '(linum-format " %7i ")
 '(python-environment-default-root-name "anything")
 '(save-place t nil (saveplace))
 '(scroll-bar-mode nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(smtpmail-smtp-service 587)
 '(tool-bar-mode nil nil (tool-bar))
 '(tooltip-mode nil)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.sg
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2e3436" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal))))
 '(highlight ((t nil))))
