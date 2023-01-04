; initialize/activate emacs package management
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '());; connect with melpa emacs lisp package repository
(add-to-list 'package-archives '("melpa"     . "http://melpa.org/packages/") t);; initialization of package list
(package-initialize)
(require 'ergoemacs-mode)
(package-refresh-contents);; Ensure `use-package` is installed - install if not
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


;; Setting directory
(cd "/home/mpaschos/Desktop/Projects/LISP")

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Set default font
(set-face-attribute 'default nil
                    :family "Noto Mono"
                    :height 140
                    :weight 'medium
                    :width 'normal)

;; load desired theme
(load-theme 'atom-one-dark t)
(enable-theme 'atom-one-dark)

;; start the initial frame maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; ergoemacs
(setq ergoemacs-theme nil) ;; Uses Standard Ergoemacs keyboard theme
(setq ergoemacs-keyboard-layout "us") ;; Assumes QWERTY keyboard layout
(ergoemacs-mode 1)


;; indentation
(setq tab-width 4)

;; Don't beep
(setq ring-bell-function (lambda ()))

;; Don't show the startup message
(setq inhibit-startup-message t
      initial-major-mode 'text-mode)

;; Some general editor niceties
(global-linum-mode -1)
(linum-mode -1)
(column-number-mode t)
(customize-set-variable 'indent-tabs-mode nil)
(add-hook 'before-save-hook #'whitespace-cleanup)
(defalias 'yes-or-no-p 'y-or-n-p)


;; Parens check
(add-hook 'after-init-hook 'show-paren-mode)

;; By default, there’s a small delay before showing a matching parenthesis. It can be deactivated with the following (which you have to do before activating show-paren-mode in your .emacs)
(setq show-paren-delay 0)


;; show-paren-mode allows one to see matching pairs of parentheses and other characters. When point is on the opening character of one of the paired characters, the other is highlighted
(require 'paren)
(show-paren-mode t)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "#C0D9DC")
(set-face-attribute 'show-paren-match t :weight 'extra-bold :underline nil)


(setq paren-dont-touch-blink nil)
(setq paren-match-face 'highlight)
(setq paren-sexp-mode t)


;; highlight brackets
(setq show-paren-style 'parenthesis)

;; highlight brackets if visible, else entire expression
(setq show-paren-style 'mixed)

;; shift-tab for indenting left
(global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)
(defun un-indent-by-removing-4-spaces ()
  "remove 4 spaces from beginning of of line"
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-line)
      ;; get rid of tabs at beginning of line
      (when (looking-at "^\\s-+")
        (untabify (match-beginning 0) (match-end 0)))
      (when (looking-at "^    ")
        (replace-match "")))))


;; Hide the mouse while typing
(setq make-pointer-invisible t)


;; Display the time and load on the modeline
(setq
 ;; don't display info about mail
 display-time-mail-function (lambda () nil)
 ;; update every 15 seconds instead of 60 seconds
 display-time-interval 15
 display-time-mode 1)

;; Display pretty things for newlines and tabs (nothing for spaces)
(setq whitespace-display-mappings
      ;; all numbers are Unicode codepoint in decimal. e.g. (insert-char 182 1)
      ;; 32 SPACE, 183 MIDDLE DOT
      '((space-mark nil)
        ;; 10 LINE FEED
        ;;(newline-mark 10 [172 10])
        (newline-mark nil)
        ;; 9 TAB, MIDDLE DOT
        (tab-mark 9 [183 9] [92 9])))



;; Indicate trailing empty lines in the GUI
;; (set-default 'indicate-empty-lines t)
(setq show-trailing-whitespace t)

(defun smart-tab ()
  "This smart tab is minibuffer compliant: it acts as usual in
the minibuffer. Else, if mark is active, indents region. Else if
point is at the end of a symbol, expands it. Else indents the
current line."
  (interactive)
  (if (minibufferp)
      (unless (minibuffer-complete)
        (dabbrev-expand nil))
    (if mark-active
        (indent-region (region-beginning)
                       (region-end))
      (if (looking-at "\\_>")
          (dabbrev-expand nil)
        (indent-for-tab-command)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; slime for common-lisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; to connect emacs with roswell
(load (expand-file-name "~/.roswell/helper.el"));; for connecting slime with current roswell Common Lisp implementation
(setq inferior-lisp-program "ros -Q run");; for slime;; and for fancier look I personally add:
(setq slime-contribs '(slime-fancy));; ensure correct indentation e.g. of `loop` form
(add-to-list 'slime-contribs 'slime-cl-indent);; don't use tabs
(setq-default indent-tabs-mode nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; slime for common-lisp using use-package
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package slime
    :ensure t
    :config
    (load (expand-file-name "~/.roswell/helper.el"))
    ;; $ ros config
    ;; $ ros use sbcl dynamic-space-size=3905
    ;; query with: (/ (- sb-vm:dynamic-space-end sb-vm:dynamic-space-start) (expt 1024 2));; set memory of sbcl to your machine's RAM size for sbcl and clisp
    ;; (but for others - I didn't used them yet)
 )

(setq slime-contribs '(slime-fancy))    ;; ensure correct indentation e.g. of `loop` form
(add-to-list 'slime-contribs 'slime-cl-indent)    ;; don't use tabs
(setq-default indent-tabs-mode nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(package-selected-packages
   (quote
    (ergoemacs-mode atom-one-dark-theme slime use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Clear REPL with Ctrl-l
(local-set-key [(control l)] 'slime-repl-clear-buffer)
