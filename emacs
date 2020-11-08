(load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

;; Package source
(require 'package)
(add-to-list 'package-archives
	     '("melpa-stable" . "https://melpa.org/packages/") t)
(package-initialize)

;; CL package
(require 'cl-lib)


;; font
(add-to-list 'default-frame-alist
  '(font . "DejaVu Sans Mono-13"))

;; theme
(load-theme 'monokai-pro t t)
(enable-theme 'monokai-pro)


;; indentation
(setq tab-width 4)



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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#757575" "#CD5542" "#4A8F30" "#7D7C21" "#4170B3" "#9B55C3" "#68A5E9" "gray43"])
 '(ansi-term-color-vector
   [unspecified "#2d2a2e" "#ff6188" "#a9dc76" "#ffd866" "#78dce8" "#ab9df2" "#a1efe4" "#fcfcfa"])
 '(cua-mode t nil (cua-base))
 '(custom-safe-themes
   (quote
    ("5846b39f2171d620c45ee31409350c1ccaddebd3f88ac19894ae15db9ef23035" "4f3646a338623330b61780fe53005cccf21e7a9812b9312394a8a6d0345fda14" default)))
 '(package-selected-packages
   (quote
    (haskell-mode rainbow-mode monokai-pro-theme leuven-theme jsonrpc hyperbole flymake flylisp flatland-theme evil elisp-format diff-hl clang-format async ample-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )