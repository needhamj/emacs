;(debug-on-error t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Extra python requirements ;;
;; sudo pip install flake8 ;;
;; sudo pip install ropemacs ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set path for flake8

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(elpy-enable)
;; (use-package elpy
;;   :ensure t
;;   :init
;;   (elpy-enable))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
;; set up el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
(with-current-buffer
(url-retrieve-synchronously
"https://raw.github.com/dimitri/el-get/master/el-get-install.el")
(goto-char (point-max))
(eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)
; list all packages you want installed
(setq my-el-get-packages
(append
'(auto-complete pymacs fill-column-indicator jedi python-pep8 flycheck color-theme web-mode tss json-mode)
;'(auto-complete pymacs fill-column-indicator jedi python-pep8 flycheck python-django color-theme web-mode tss json-mode)
(mapcar 'el-get-source-name el-get-sources)))
(el-get 'sync my-el-get-packages)
;; interactive mode
(require 'ido)
(ido-mode t)
;; autocomplete
(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete")
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)
;; pymacs
;;(add-to-list 'load-path "~/.emacs.d/el-get/pymacs")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")
(add-to-list 'load-path "~/.emacs.d/el-get/python-mode")

;; ropemacs -
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.sls\\'" . yaml-mode))
;; tss
;; If use bundled typescript.el,
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
(require 'tss)
;; Key binding
(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")
;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "tss")
;; Do setting recommemded configuration
(tss-config-default)
;; 80 character line
;; Fill column-number-mode
(setq-default fill-column 79)
(add-to-list 'load-path "~/.emacs.d/el-get/fill-column-indicator")
(require 'fill-column-indicator)
(define-globalized-minor-mode
global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (yasnippet let-alist)))
 '(show-paren-mode t)
 '(size-indication-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "Black" :foreground "BlanchedAlmond" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 83 :width normal :family "DejaVu Sans Mono" :foundry "unknown"))))
 '(border ((t nil)))
 '(cursor ((t (:background "firebrick1" :foreground "black"))))
 '(font-lock-comment-delimiter-face ((default (:inherit font-lock-comment-face :weight ultra-bold)) (((class color) (min-colors 16)) nil)))
 '(font-lock-comment-face ((t (:foreground "lime green"))))
 '(font-lock-doc-face ((t (:foreground "tomato" :slant italic))))
 '(font-lock-function-name-face ((t (:foreground "deep sky blue" :underline t :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "yellow" :weight bold))))
 '(font-lock-string-face ((t (:foreground "tomato" :slant italic))))
 '(fringe ((nil (:background "black"))))
 '(highlight ((t (:background "khaki1" :foreground "black" :box (:line-width -1 :color "firebrick1")))))
 '(highlight-current-line-face ((t (:inherit highlight))))
 '(lazy-highlight ((t (:background "paleturquoise" :foreground "black"))))
 '(link ((t (:foreground "DodgerBlue3" :underline t))))
 '(menu ((t (:background "gray2" :foreground "#FFF991"))))
 '(minibuffer-prompt ((t (:foreground "royal blue"))))
 '(mode-line ((t (:background "dark olive green" :foreground "dark blue" :box (:line-width -1 :color "gray75") :weight bold))))
 '(mode-line-buffer-id ((t (:background "dark olive green" :foreground "beige"))))
 '(mode-line-highlight ((((class color) (min-colors 88)) nil)))
 '(mode-line-inactive ((t (:background "dark olive green" :foreground "dark khaki" :weight light))))
 '(mouse ((t (:background "Grey" :foreground "black"))))
 '(trailing-whitespace ((((class color) (background dark)) (:background "firebrick1")))))
(setq indent-tabs-mode nil)
;; display line numbers to the right of the window
;; Enable line numbers
(global-linum-mode t)
(eval-after-load 'linum
'(progn
(defface linum-leading-zero
`((t :inherit 'linum
:foreground ,(face-attribute 'linum :background nil t)))
"Face for displaying leading zeroes for line numbers in display margin."
:group 'linum)
(defun linum-format-func (line)
(let ((w (length
(number-to-string (count-lines (point-min) (point-max))))))
(concat
(propertize (make-string (- w (length (number-to-string line))) ?0)
'face 'linum-leading-zero)
(propertize (number-to-string line) 'face 'linum))))
(setq linum-format 'linum-format-func)))
(setq linum-format "%4d|")
(setq mode-line-format
(list
;; value of `mode-name'
"%m: "
;; value of current buffer name
"buffer %b, "
;; value of current line number
"line %l "
"-- user: "
;; value of user
(getenv "USER")))
;; show the current line and column numbers in the stats bar as well
(line-number-mode t)
(column-number-mode t)
;; JEDI
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'elpy-mode)
(setq jedi:setup-keys t) ; optional
(setq jedi:complete-on-dot t) ; optional
(setq jedi:tooltip-method '(popup))
(add-to-list 'load-path "~/.emacs.d/el-get/python-pep8")
(require 'python-pep8)
(add-to-list 'load-path "~/.emacs.d/el-get/flycheck")
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(global-set-key (kbd "C-x j") 'python-django-open-project)
;; remove trailing spaces before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;-------------------------;
;;; Syntax Highlighting ;;;
;-------------------------;
; text decoration
(require 'font-lock)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)
(global-hi-lock-mode nil)
(setq jit-lock-contextually t)
(setq jit-lock-stealth-verbose t)
; if there is size information associated with text, change the text
; size to reflect it
(size-indication-mode t)
; highlight parentheses when the cursor is next to them
(require 'paren)
(show-paren-mode t)
(global-set-key [f6] 'insert-ipdb)
;;ipdb
(defun insert-ipdb ()
"insert ipdb"
(interactive)
(insert "import ipdb; ipdb.set_trace()"))
;-----------------;
;;; Color Theme ;;;
;-----------------;
; use the "Subtle Hacker" color theme as a base for the custom scheme
;(require 'color-theme)
;(color-theme-initialize)
;(setq color-theme-is-global t)
;(color-theme-subtle-hacker)

; make sure the frames have the dark background mode by default
(setq default-frame-alist (quote (
(frame-background-mode . dark)
)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Mode line setup
(setq-default
mode-line-format
'(; Position, including warning for 80 columns
(:propertize "%8l:" face mode-line-position-face)
(:eval (propertize "%4c" 'face
(if (>= (current-column) 80)
'mode-line-80col-face
'mode-line-position-face)))
; emacsclient [default -- keep?]
mode-line-client
" "
; read-only or modified status
(:eval
(cond (buffer-read-only
(propertize " RO " 'face 'mode-line-read-only-face))
((buffer-modified-p)
(propertize " ** " 'face 'mode-line-modified-face))
(t " ")))
" "
; directory and buffer/file name
(:propertize (:eval (shorten-directory default-directory 15))
face mode-line-folder-face)
(:propertize "%b"
face mode-line-filename-face)
; narrow [default -- keep?]
" %n "
; mode indicators: vc, recursive edit, major mode, minor modes, process, global
(vc-mode vc-mode)
" %["
(:propertize mode-name
face mode-line-mode-face)
"%] "
(:eval (propertize (format-mode-line minor-mode-alist)
'face 'mode-line-minor-mode-face))
(:propertize mode-line-process
face mode-line-process-face)
(global-mode-string global-mode-string)
" "
; nyan-mode uses nyan cat as an alternative to %p
(:eval (when nyan-mode (list (nyan-create))))
))
;; Helper function
(defun shorten-directory (dir max-length)
"Show up to `max-length' characters of a directory name `dir'."
(let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
(output ""))
(when (and path (equal "" (car path)))
(setq path (cdr path)))
(while (and path (< (length output) (- max-length 4)))
(setq output (concat (car path) "/" output))
(setq path (cdr path)))
(when path
(setq output (concat ".../" output)))
output))
;; Extra mode line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-80col-face)
;; (set-face-attribute 'mode-line nil
;;     :foreground "gray60" :background "gray20"
;;     :inverse-video nil
;;     :box '(:line-width 6 :color "gray20" :style nil))
;; (set-face-attribute 'mode-line-inactive nil
;;     :foreground "gray80" :background "gray40"
;;     :inverse-video nil
;;     :box '(:line-width 6 :color "gray40" :style nil))

;; (set-face-attribute 'mode-line-read-only-face nil
;;     :inherit 'mode-line-face
;;     :foreground "#4271ae"
;;     :box '(:line-width 2 :color "#4271ae"))
;; (set-face-attribute 'mode-line-modified-face nil
;;     :inherit 'mode-line-face
;;     :foreground "#c82829"
;;     :background "#ffffff"
;;     :box '(:line-width 2 :color "#c82829"))
;; (set-face-attribute 'mode-line-folder-face nil
;;     :inherit 'mode-line-face
;;     :foreground "gray60")
;; (set-face-attribute 'mode-line-filename-face nil
;;     :inherit 'mode-line-face
;;     :foreground "#eab700"
;;     :weight 'bold)
;; (set-face-attribute 'mode-line-position-face nil
;;     :inherit 'mode-line-face
;;     :family "Menlo" :height 100)
;; (set-face-attribute 'mode-line-mode-face nil
;;     :inherit 'mode-line-face
;;     :foreground "gray80")
;; (set-face-attribute 'mode-line-minor-mode-face nil
;;     :inherit 'mode-line-mode-face
;;     :foreground "gray40"
;;     :height 110)
;; (set-face-attribute 'mode-line-process-face nil
;;     :inherit 'mode-line-face
;;     :foreground "#718c00")
;; (set-face-attribute 'mode-line-80col-face nil
;;     :inherit 'mode-line-position-face
;;     :foreground "black" :background "#eab700")


; make sure the frames have the dark background mode by default
(setq default-frame-alist (quote (
(frame-background-mode . dark)
)))



;;set the keybinding so that you can use f4 for goto line
(global-set-key [f4] 'goto-line)
;;set the keybinding so that f3 will start the shell
(global-set-key [f3] 'shell)
;;set the keybinding so that f5 will start query replace
(global-set-key [f5] 'query-replace)
(global-set-key (kbd "C-c ;") 'comment-region)
(global-set-key (kbd "C-c :") 'uncomment-region)

(setq cua-enable-cua-keys nil)
(cua-mode)
(put 'scroll-left 'disabled nil)

(add-to-list 'load-path "~/.emacs.d/ttl-mode")
(autoload 'ttl-mode "ttl-mode" "Major mode for OWL or Turtle files" t)
(add-hook 'ttl-mode-hook    ; Turn on font lock when in ttl mode
          'turn-on-font-lock)
(add-to-list 'load-path "~/.emacs.d/kotlin-mode")
(autoload 'kotlin-mode "kotlin-mode" "Major mode for kotlin files" t)
(add-hook 'kotlin-mode-hook    ; Turn on font lock when in kotlin mode
          'turn-on-font-lock)
(setq auto-mode-alist
      (append
       (list
        '("\\.n3" . ttl-mode)
        '("\\.ttl" . ttl-mode))
       auto-mode-alist))
(setq auto-mode-alist
      (append
       (list
        '("\\.yaml" . yaml-mode)
        '("\\.yml" . yaml-mode))
       auto-mode-alist))
