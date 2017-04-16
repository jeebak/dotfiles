;; spacemacs configurations
;; -----------------------------------------------------------------------------
;; http://www.jesshamrick.com/2013/03/31/macs-and-emacs/
(defun system-is-mac ()
  (interactive)
  (string-equal system-type "darwin"))

(defun system-is-linux ()
  (interactive)
  (string-equal system-type "gnu/linux"))
;; -----------------------------------------------------------------------------
;; http://spacemacs.org/doc/FAQ.html

;; 2.6 Enable navigation by visual lines?
;; Make evil-mode up/down operate in screen lines instead of logical lines
(define-key evil-motion-state-map "j" 'evil-next-visual-line)
(define-key evil-motion-state-map "k" 'evil-previous-visual-line)
;; Also in visual mode
(define-key evil-visual-state-map "j" 'evil-next-visual-line)
(define-key evil-visual-state-map "k" 'evil-previous-visual-line)

;; 2.16 Make copy/paste working with the mouse in X11 terminals?
(xterm-mouse-mode -1)
;; -----------------------------------------------------------------------------
;; Line Number layout too close when using spacemacs in iTerm(and OSX terminal)
;;   https://github.com/syl20bnr/spacemacs/issues/5609
;;   https://gist.github.com/arronmabrey/344c40a9157e31544d76f092b70a4809
(setq linum-format "%4d ")

(defcustom linum-relative-format "%4s "
  "Format for each line. Good for adding spaces/paddings like so: \" %3s \""
  :type 'string
  :group 'linux-relative)
(setq linum-relative-format "%4s ")
;; -----------------------------------------------------------------------------
;; http://stackoverflow.com/questions/19054228/emacs-disable-theme-background-color-in-terminal
(unless (display-graphic-p)
  (set-face-background 'default "unspecified-bg"))
  ; NOTE: this seems to be overridden by themes

;; https://www.emacswiki.org/emacs/HighlightCurrentLine
;; http://stackoverflow.com/questions/17701576/changing-highlight-line-color-in-emacs

; Turn on hl-line:
(global-hl-line-mode 1)
; Set any color as the background face of the current line:
(set-face-background 'hl-line "#3e4446")
; To keep syntax highlighting in the current line:
(set-face-foreground 'highlight nil)

;; https://www.emacswiki.org/emacs/CrosshairHighlighting
;; https://www.emacswiki.org/emacs/HighlightCurrentColumn
;  (set-face-background 'crosshairs "cyan")
;; -----------------------------------------------------------------------------
;; Set CWD as Emacs Default Director
;; http://stackoverflow.com/questions/354490/preventing-automatic-change-of-default-directory
(setq default-directory command-line-default-directory)
;; -----------------------------------------------------------------------------
;; (rainbow-mode)
(auto-complete-mode t)
;; -----------------------------------------------------------------------------
;; Currently, the develop branch of spacemacs switched to diff-hl
;; https://github.com/syl20bnr/spacemacs/issues/1872
;; http://stackoverflow.com/questions/7790382/how-to-determine-whether-a-package-is-installed-in-elisp
(eval-after-load 'diff-hl
  (progn
    (setq diff-hl-side 'right)
    (add-hook 'prog-mode-hook 'diff-hl-mode)
    (add-hook 'dired-mode-hook 'diff-hl-dired-mode)))
;; -----------------------------------------------------------------------------
;; Setting and showing the 80-character column width
(set-fill-column 80)
;; -----------------------------------------------------------------------------
(auto-fill-mode t)
;; -----------------------------------------------------------------------------
;; Override Default Keybindings To Familiar Vim Plugins
;; hippie-expand -> CtrlP
;; https://github.com/syl20bnr/spacemacs/issues/1544
(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile-find-file)

;; Setting Mark -> CtrlSpace
;; Recent Files are also dislayed with: ... 'helm-mini)
(define-key evil-normal-state-map (kbd "C-@") 'helm-projectile-switch-to-buffer)

;; https://www.emacswiki.org/emacs/SwitchingBuffers
(define-key evil-normal-state-map (kbd "TAB") 'mode-line-other-buffer)
;; -----------------------------------------------------------------------------
;; (toggle-fill-column-indicator) SPC t f
;; -----------------------------------------------------------------------------
;; 2-space indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
;; -----------------------------------------------------------------------------
;; https://www.reddit.com/r/emacs/comments/35eoq3/how_i_use_vim_transferring_to_emacs_spacemacs
;; You can always toggle line number with SPC t n and linum relative with
;;   SPC t r
;; You must toggle SPC t n first before using SPC t r.
;; -----------------------------------------------------------------------------
;; http://thume.ca/howto/2015/03/07/configuring-spacemacs-a-tutorial/
