;;hm_development

;; js-mode-hook has also been tried
(add-hook 'js-mode-hook
      '(lambda()
        (setq js-indent-level 4)))

(add-hook 'js2-mode-hook
      '(lambda()
        (setq js-indent-level 4)))

(add-hook 'js2-mode-hook
      '(lambda()
        (setq tab-width 4)))

(add-hook 'css-mode-hook
      '(lambda()
        (setq tab-width 4)))

(add-hook 'html-mode-hook
      '(lambda()
        (setq tab-width 8)))

(add-to-list 'load-path "~/.emacs.d/el-get/python-mode")
(add-to-list 'load-path "~/.emacs.d/plugin/flymake-python")

(require 'python-mode)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

(load-file "~/.emacs.d/plugin/pdb-mode.el")
;; (load-file "/{path-to}/pdb-mode.el") 
(setq auto-mode-alist 
      (cons (cons "pdb$" 'pdb-mode) 
            auto-mode-alist ) ) 
(autoload 'pdb-mode "PDB")

(require 'django-html-mode)
(add-to-list 'auto-mode-alist '("\\.html$" . django-html-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . django-html-mode))

(put 'upcase-region 'disabled nil)

(add-to-list 'load-path "~/.emacs.d/el-get/git-emacs")
(require 'git-emacs)

;; (add-to-list 'load-path "/home/hchoi/.emacs.d/el-get/psvn")
;; (require 'psvn)

(setq password-cache-expiry nil)

(setq cscope-do-not-update-database t)
(load-file "~/.emacs.d/plugin/cscope/xcscope.el")
(require 'xcscope)
(setq cscope-initial-directory "~/work/cscope")

;; (add-to-list 'load-path "~/.emacs.d/plugin/php-mode")
;; (require 'php-mode)


;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)

(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/el-get/auto-complete/dict")
(ac-config-default)

(add-to-list 'load-path "~/.emacs.d/el-get")

;; js2-mode for emacs24
;; (add-to-list 'load-path "~/.emacs.d/plugin/js2-mode")
;; (autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))

;; code checking via flymake
;; set code checker here from "epylint", "pyflakes"
(setq pycodechecker "pyflakes")
(when (load "flymake" t)
  (defun flymake-pycodecheck-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list pycodechecker (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pycodecheck-init)))


(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-bu
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "~/.emacs.d/plugin/flymake-python/pyflymake.py" (list local-file))))
      ;;     check path

  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))


(add-hook 'find-file-hook 'flymake-find-file-hook)

(load-library "flymake-cursor")
(global-set-key [f10] 'flymake-goto-prev-error)
(global-set-key [f11] 'flymake-goto-next-error)

(setq python-check-command "pyflakes")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;enable pep8
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; To enable pep8 check
;; install pep8 checker with one of those commands
;; sudo apt-get install pep8
;; or
;; sudo pip install pep8

;; (when (load "flymake" t)
;;  (defun flymake-pylint-init ()
;;    (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                       'flymake-create-temp-inplace))
;;           (local-file (file-relative-name
;;                        temp-file
;;                        (file-name-directory buffer-file-name))))
;;          (list "pep8" (list "--repeat" local-file))))

;;  (add-to-list 'flymake-allowed-file-name-masks
;;               '("\\.py\\'" flymake-pylint-init)))

;; (defun my-flymake-show-help ()
;;   (when (get-char-property (point) 'flymake-overlay)
;;     (let ((help (get-char-property (point) 'help-echo)))
;;       (if help (message "%s" help)))))

;; (add-hook 'post-command-hook 'my-flymake-show-help)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; w3m
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
(global-set-key "\C-xm" 'browse-url-at-point)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; pylookup
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; add pylookup to your loadpath, ex) ~/.emacs.d/pylookup
(setq pylookup-dir "~/.emacs.d/el-get/pylookup")
(add-to-list 'load-path pylookup-dir)

;; load pylookup when compile time
(eval-when-compile (require 'pylookup))

;; set executable file and db file
(setq pylookup-program (concat pylookup-dir "/pylookup.py"))
(setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))

;; set search option if you want
(setq pylookup-search-options '("--insensitive" "0" "--desc" "0"))

;; to speedup, just load it on demand
(autoload 'pylookup-lookup "pylookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)

;; (autoload 'pylookup-update "pylookup" 
;;  "Run pylookup-update and create the database at `pylookup-db-file'." t)

(global-set-key "\C-ch" 'pylookup-lookup)
(setq browse-url-browser-function 'w3m-browse-url) ;; w3m

;; (delete '("\\.html?\\'" flymake-xml-init) flymake-allowed-file-name-masks)

(global-auto-revert-mode t)

(require 'autopair)
(autopair-global-mode) ;; to enable in all buffers

(require 'multiple-cursors)

;; highlight selection
(require 'highlight-symbol)


;; example of setting env var named “path”, by appending a new path to existing path
(setenv "PATH"
  (concat
   "~/.virt_env/anything/bin/virtualenv" ";"
   (getenv "PATH")
  )
)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(virtualenv-workon "anything")
