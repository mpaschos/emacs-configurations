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

;; Setting directory
(cd "C:/Users/MPaschos/Desktop/software_projects/LISP/" )

(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Set default font
(set-face-attribute 'default nil
                    :family "Fira Code Retina"
		    :height 110
                    :weight 'normal
                    :width 'normal)


;; load desired theme
(load-theme 'solarized-dark t)
(enable-theme 'solarized-dark)

;; disable all custom themes
;; (dolist (theme custom-enabled-themes)
;;   (disable-theme theme))

;; start the initial frame maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; indentation
(setq tab-width 4)



;; Haskell configs
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)

;; hslint on the command line only likes this indentation mode;
;; alternatives commented out below.
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

;; Ignore compiled Haskell files in filename completions
(add-to-list 'completion-ignored-extensions ".hi")




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
    ("c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "973b8e5ea4b38eb6d85c45199b1cac85844b5c93800822da663445a1b6b3f1b9" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" "7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "83e0376b5df8d6a3fbdfffb9fb0e8cf41a11799d9471293a810deb7586c131e6" "78c4238956c3000f977300c8a079a3a8a8d4d9fee2e68bad91123b58a4aa8588" "6bdcff29f32f85a2d99f48377d6bfa362768e86189656f63adbf715ac5c1340b" "4eb6fa2ee436e943b168a0cd8eab11afc0752aebb5d974bba2b2ddc8910fca8f" "d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" "4eb69f17b4fa0cd74f4ff497bb6075d939e8d8bf4321ce8b81d13974000baac1" "d2f5f035c857ef7aa496a99d0e1ce28ceaa810fd968086935d475da43a14aa1f" "c7eb06356fd16a1f552cfc40d900fe7326ae17ae7578f0ef5ba1edd4fdd09e58" "c9ddf33b383e74dac7690255dd2c3dfa1961a8e8a1d20e401c6572febef61045" "36ca8f60565af20ef4f30783aa16a26d96c02df7b4e54e9900a5138fb33808da" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "9e39a8334e0e476157bfdb8e42e1cea43fad02c9ec7c0dbd5498cf02b9adeaf1" "5d59bd44c5a875566348fa44ee01c98c1d72369dc531c1c5458b0864841f887c" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "095f1ee0ae3ec09d52d2bea339258f69b804827155091325fd96b6aa1f159beb" "bf798e9e8ff00d4bf2512597f36e5a135ce48e477ce88a0764cfb5d8104e8163" "5846b39f2171d620c45ee31409350c1ccaddebd3f88ac19894ae15db9ef23035" "4f3646a338623330b61780fe53005cccf21e7a9812b9312394a8a6d0345fda14" default)))
 '(package-selected-packages
   (quote
    (haskell-tab-indent multishell zenburn-theme slime-theme spacemacs-theme gruvbox-theme blackboard-theme peacock-theme ample-zen-theme ample-theme sublime-themes fira-code-mode solarized-theme irony company haskell-mode rainbow-mode wheatgrass-theme flymake flylisp elisp-format diff-hl clang-format async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 


    