(package-initialize)
;;(add-to-list 'load-path "/home/kshan001/.emacs.d/elpa/")
;;(add-to-list 'custom-theme-load-path "/home/kshan001/.emacs.d/themes/")
;;(add-to-list 'load-path "/Users/carthique/.emacs.d/lisp/")
;;(add-to-list 'custom-theme-load-path "/Users/carthique/.emacs.d/themes/")

(setq inhibit-splash-screen t)         ; hide welcome screen
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'dired)

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(defun fontify-frame (frame)
  (interactive)
  (if window-system
      (progn
        (if (> (x-display-pixel-height) 1080)
            (set-face-attribute 'default nil :height 140)
         (set-face-attribute 'default nil :height 125)))))

;; Fontify current frame
(fontify-frame nil)

;; Fontify any future frames
(push 'fontify-frame after-make-frame-functions)

(setq x-select-request-type 'STRING)
;;(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
;(run-with-idle-timer 0.1 nil 'toggle-fullscreen)
(set-cursor-color "#ffffff")
;;(set-face-attribute 'default nil :height 140)

;; Any add to list for package-archives (to add marmalade or melpa) goes here
(add-to-list 'package-archives
             '("MELPA" .
               "http://melpa.milkbox.net/packages/"))

(use-package xah-get-thing :defer t)
(require 'xah-get-thing)
;; Enable emacs package manager
(use-package thingatpt :defer t)
;;(use-package thingatpt+ :defer t)
(use-package xah-replace-pairs :defer t)
;;(require 'xeu_elisp_util)
(use-package desktop :defer t)
(use-package whitespace :defer t)
;(require 'auto-complete)
;(require 'auto-complete-config)
;(require 'yasnippet)
;;(require 'sudo-edit)
(use-package simplenote2 :defer t)
(use-package expand-region :defer t)
;(require 'xcscope)
(use-package bpr :defer t)
(use-package f :defer t)
;;(use-package scp :defer t)
(use-package hungry-delete :defer t)
(use-package anzu :defer t)
(use-package smart-tab :defer t)
(use-package zenburn-theme :defer t)
;;(require 'company-tabnine)
(use-package smex :defer t)
(use-package rainbow-delimiters :defer t)
(use-package magit :defer t)
(use-package dumb-jump :defer t)
(use-package wgrep :defer t)
(use-package go-mode :defer t)
(use-package go-autocomplete :defer t)
(use-package go-guru :defer t)
(use-package flymake-go :defer t)
(use-package go-eldoc :defer t)
(use-package docker :defer t)
(use-package dockerfile-mode :defer t)
(use-package elpy :defer t)
(use-package flycheck :defer t)
(use-package py-autopep8 :defer t)
(use-package blacken :defer t)
(use-package pylint :defer t)


(autoload 'gid "idutils" nil t)
(ac-config-default)

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)

(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;;; No Menubar, Toolbar and Scrollbar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; Also shrink fringes to 1 pixel.
(fringe-mode 1)
;; You are strongly encouraged to enable something like `ido-mode' to alter
;; the default behavior of 'C-x b', or you will take great pains to switch
;; to or back from a floating frame (remember 'C-x 5 o' if you refuse this
;; proposal however).
;; You may also want to call `exwm-config-ido' later (see below).
;;(ido-mode 1)

;; y and n format
(fset 'yes-or-no-p 'y-or-n-p)
;; do not make backup files
(setq make-backup-files nil)
;; set diff files to be read-only
(setq diff-default-read-only t)
;; make the current 'selection' visible
(transient-mark-mode t)
;; delete the selection area with a keypress
(delete-selection-mode t)
;; windows style copy paste
(cua-mode t)
;; Enable option key on MAC
(setq x-alt-keysym 'super)
;; Set default tab width to 4
(setq-default tab-width 4)
;; disable system bell
(setq ring-bell-function 'ignore)
;; disable tabs for indentation
(setq-default indent-tabs-mode nil)
;; disable tabs in Make files
(add-hook 'makefile-mode-hook (lambda () (setq indent-tabs-mode t)))
;;Setup cscope
;;(setq cscope-option-do-not-update-database t)
;;Org mode link click
(setq org-return-follows-link nil)
;; Set the desktop save mode
;;(desktop-save-mode 1)
(setq desktop-restore-frames nil)
;; Show matching parens
(show-paren-mode t)
;; Tell tramp to use ftp
(setq tramp-default-method "scp")
;;Enable rainbow delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
;; Enable whitespace markers
;;(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)
;; xah find parameters
(setq xah-find-file-background-color "blue")
(setq xah-find-match-background-color "green")
;; enable clipboard in emacs
(setq x-select-enable-clipboard t)
(global-hungry-delete-mode t)
;;(yas-global-mode 1)
(global-auto-revert-mode) 1
;; auto refresh dired when file changes
(add-hook 'dired-mode-hook 'auto-revert-mode)

;;Sudo dired support
(define-key dired-mode-map (kbd "C-c C-r") 'dired-toggle-sudo)
;(eval-after-load 'tramp
;  '(progn
;     ;;Allow to use: /sudo:user@host:/path/to/file
;     (add-to-list 'tramp-default-proxies-alist
;                  '(".*" "\\`.+\\'" "/ssh:%h:"))))

;; Define our own C/C++ style */
(setq c-default-style "linux"
      c-basic-offset 4
      c-tab-always-indent t
      indent-tabs-mode nil)
(defconst my-c-style
  '((c-tab-always-indent . t)
    (c-set-offset 'substatement-open 0)
    (c-set-offset 'case-label +)
    (c-basic-offset . 4)
    (indent-tabs-mode . nil)
    )
  "My C Programming Style")
(defun my-c-mode-common-hook ()
  ;;(c-add-style "PERSONAL" my-c-style t)
  ;;(setq c-recognize-knr-p t)
  (c-set-offset 'case-label '4)
  (define-key c-mode-map "\C-m" 'newline-and-indent)
  (define-key c-mode-map "\C-c\C-s" 'org-insert-email-as-current-todo)
  (local-set-key [f9]    'compile-cpm-in-parent-directory)
  (local-set-key [C-f9]  'compile-hops-in-parent-directory)
  (local-set-key [M-f9]  'compile-both-in-parent-directory)
  (local-set-key [S-f9]  'compile-everything-in-parent-directory)
  (local-set-key [C-M-f9]  'compile-x86-in-parent-directory)
  (local-set-key "\M-g"      'dumb-jump-go)

  ;;(cscope-minor-mode t)
  ;;(company-mode t)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook) 
;; set this in all c-based programming modes
(add-hook 'c-mode-common-hook
          (lambda ()
            (c-set-offset 'case-label '+)))
;;(add-hook 'c-mode-hook 'cscope-minor-mode)

;;Show number of matches in mode-line while searching
(global-anzu-mode +1)

;; Smart tabs
(global-smart-tab-mode 1)

;; Themes
;;(load-theme 'material t)
;;(load-theme 'dark-laptop t)
(load-theme 'zenburn t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "68d36308fc6e7395f7e6355f92c1dd9029c7a672cbecf8048e2933a053cf27e6" "400994f0731b2109b519af2f2d1f022e7ced630a78890543526b9342a3b04cf1" default))
 '(global-evil-search-highlight-persist t)
 '(magit-commit-arguments '("--all"))
 '(magit-diff-arguments nil)
 '(magit-fetch-arguments '("--prune"))
 '(magit-pull-arguments nil)
 '(package-selected-packages
   '(pyenv-mode-auto pylint blacken elpy leetcode dockerfile-mode docker go-eldoc k8s-mode kubernetes yaml-mode neotree go-guru go-autocomplete exec-path-from-shell go-complete exwm xah-replace-pairs dired xeu_elisp_util xfrp_find_replace_pairs use-package company-tabnine string-inflection org-jira dumb-jump scp ssh fzf dash s py-autopep8 multi-compile git bpr magit-org-todos magit-filenotify magit expand-region iedit auto-complete-c-headers yasnippet auto-compile ibuffer-git hungry-delete hydandata-light-theme pt wgrep avy igrep zenburn-theme xah-find thingatpt+ sudo-edit smex smart-tab simplenote2 rainbow-delimiters material-theme leuven-theme highlight hc-zenburn-theme gotham-theme git-timemachine gh dired-toggle-sudo atom-dark-theme anzu alert ac-alchemist)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Wgrep
(setq wgrep-auto-save-buffer t)
;;C-c C-p: Toggle read-only area.
;;C-c C-e: Apply the changes to file buffers.
;;C-c C-u: All changes are unmarked and ignored.
;;C-c C-d: Mark as delete to current line (including newline).
;;C-c C-r: Remove the changes in the region (these changes are not applied to the files. Of course, the remaining changes can still be applied to the files.)
;;C-c C-k: Discard all changes and exit.
;;C-x C-q: Exit wgrep mode.


;; Function Key bindings
;;(global-set-key [f1]    (lambda() (interactive)(find-file "~/backup/scratchpad/notepad.org")))
;;(global-set-key [M-f1]   (lambda() (interactive)(dired "~/backup/scratchpad/")))
(global-set-key [f1]   (lambda() (interactive)(simplenote2--open-note "~/.simplenote2/notes/1cc4f8eb680111e7b118d5b0153eff08")))
(global-set-key [M-f1]    'simplenote2-list)
(global-set-key [s-f1]  'open-log-file)
(global-set-key [C-f1]  (lambda() (interactive)(find-file "~/backup/scratchpad/todo.org")))
(global-set-key [f2]    'goto-line)
(global-set-key [f3]    'magit-status)
(global-set-key [f4]    'magit-show-refs)
(global-set-key [f5]    'my-revert-buffer)
(global-set-key [M-f5] 'vc-revert)
(global-set-key [f6]    'magit-blame-addition)
(global-set-key [M-f6]  'git-timemachine)
(global-set-key [f7]    'magit-log-buffer-file)
(global-set-key [f8]    'magit-log-current)
(global-set-key [M-f8]  'magit-log-all-branches)
;(global-set-key [f10]  (lambda() (interactive)(find-file "~/backup/scratchpad/temp.log")))
(global-set-key [f10]   (lambda() (interactive)(simplenote2--open-note "~/.simplenote2/notes/ef8a33ba680311e7bde43da2e452bf1f")))
(global-set-key [f11]   'match-paren)
(global-set-key [f12]   'open-emacs-file)
(global-set-key [M-f12] 'load-emacs)
(global-set-key (kbd "C-Q") 'er/expand-region)
(global-set-key [C-f2] (lambda() (interactive)(set-face-attribute 'default nil :height 125)))
(global-set-key [M-f2] (lambda() (interactive)(set-face-attribute 'default nil :height 140)))
;(global-set-key (kbd "C-a") 'mark-whole-buffer)

(global-set-key (kbd "M-0") 'magit-refs-ws0)
(global-set-key (kbd "M-1") 'magit-refs-ws1)
(global-set-key (kbd "M-2") 'magit-refs-ws2)
(global-set-key (kbd "M-3") 'magit-refs-ws3)
(global-set-key (kbd "M-4") 'magit-refs-ws4)
(global-set-key (kbd "M-5") 'magit-refs-ws5)
(global-set-key (kbd "M-6") 'magit-refs-ws6)
(global-set-key (kbd "M-7") 'magit-refs-ws7)

;; Control Key bindings
(global-set-key [C-M-up] 'beginning-of-buffer)
(global-set-key [C-M-down] 'end-of-buffer)
(global-set-key [C-s-up] 'backward-up-list)
(global-set-key [C-s-down] 'forward-list)
(global-set-key "\C-x\C-x" 'buffer-menu)
(global-set-key "\C-c\C-x" 'pretty-print-xml-region)
(global-set-key [(control x) (k)] 'kill-this-buffer)

(global-set-key "\C-x\C-a" 'fzf)
(global-set-key "\M-z" 'toggle-frame-fullscreen)
(define-key cua-global-keymap [C-return] 'org-open-at-point)

(setq dumb-jump-fallback-search nil)
;; Meta Key bindings
(global-set-key [M-up] 'c-beginning-of-defun)
(global-set-key [M-down] 'c-end-of-defun)
;;(global-set-key "\M-s"      'cscope-find-this-symbol)
(global-set-key "\M-s"      'git-grep)
(global-set-key "\M-l"      'git-grep-local)
;;(global-set-key "\M-g"      'cscope-find-global-definition)
;;(global-set-key "\M-f"      'cscope-find-this-file)
;;(global-set-key "\M-i"      'cscope-find-files-including-file)
(global-set-key "\M-d"      'vc-diff)
(global-set-key "\M-D"      'vc-root-diff)
(global-set-key "\C-\M-d"      'magit-diff-range)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Super Key bindings
(global-set-key (kbd "s-s") 'mygrep)
(global-set-key (kbd "s-l") 'mygrep_file)
(global-set-key (kbd "s-a") 'mygrep_dir_all)
(global-set-key [s-down] 'next-error)
(global-set-key [s-up] 'previous-error)
;;(global-set-key [s-down] 'smerge-next)
;;(global-set-key [s-up] 'smerge-prev)
(global-set-key (kbd "s-m") 'smerge-keep-mine)
(global-set-key (kbd "s-o") 'smerge-keep-other)
(global-set-key (kbd "s-c") 'comment-or-uncomment-region)
(global-set-key (kbd "s-h") 'highlight-symbol-at-point)
(global-set-key (kbd "s-0") 'magit-refs-ws0)
(global-set-key (kbd "s-1") 'magit-refs-ws1)
(global-set-key (kbd "s-2") 'magit-refs-ws2)
(global-set-key (kbd "s-3") 'magit-refs-ws3)
(global-set-key (kbd "s-4") 'magit-refs-ws4)
(global-set-key (kbd "s-5") 'magit-refs-ws5)
(global-set-key (kbd "s-6") 'magit-refs-ws6)
(global-set-key (kbd "s-7") 'magit-refs-ws7)
(global-set-key (kbd "s-d") (lambda() (interactive)(write-file "~/patch.diff")))
(global-set-key (kbd "s-w") 'gid)
(global-set-key (kbd "s-<left>")  'windmove-left)
(global-set-key (kbd "s-<right>") 'windmove-right)
(global-set-key (kbd "s-c") 'string-inflection-lower-camelcase)
(global-set-key (kbd "s-g") 'simplenote2-sync-notes)

;;Diff mode hooks
(add-hook 'diff-mode-hook
          (lambda () (local-set-key (kbd "C-d") 'diff-split-hunk)))

(add-to-list 'auto-mode-alist '("\\.in\\'" . python-mode))
;;(add-to-list 'company-backends #'company-tabnine)

;; Function Definitions
(defun load-emacs ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun my-revert-buffer ()
  "Revert buffer without confirmation."
  (interactive) (delete-other-windows) (revert-buffer t t) (redraw-display))

(setq compile-command "")
(defun compile-both-in-parent-directory ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat default-directory "../")))
    (compile "mk dctor.both.i386")))

(defun compile-hops-in-parent-directory ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat default-directory "../")))
    (compile "mk dctor.both.hops")))

(defun compile-cpm-in-parent-directory ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat default-directory "../")))
    (compile "mk 7xxx.cpm.i386")))

(defun compile-all-in-parent-directory ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat default-directory "../")))
    (compile "mk cpm dctor.both.i386 dctor.boot.i386")))

(defun compile-everything-in-parent-directory ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat default-directory "../")))
    (compile "mk")))

(defun compile-x86-in-parent-directory ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat default-directory "../")))
    (compile "mk dctor.both.x86")))

(defun open-log-file ()
  (interactive)
  (find-file "~/.screen_log"))

(defun open-emacs-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defun mygrep_dir_all ()
  "grep function for grepint `xah-get-thing-at-cursor' "
  (interactive)
  (let (mygrepresult)
    (setq bds (xah-get-thing-at-cursor 'word))
    (setq myresult (elt bds 0) p1 (elt bds 1) p2 (elt bds 2))
    (setq mystr (replace-regexp-in-string "-" (rx "\\-") myresult))
    (let ((default-directory
            (f-long(vc-root-dir))))
      (grep (concat "cat cscope.files | xargs grep -sn -e '" myresult "'\\\\\\|^\\\\w.*\\( . | grep -B 1 '"  myresult "'")
            ))))

(defun mygrep ()
  "grep function for grepint `xah-get-thing-at-cursor' "
  (interactive)
  (let (mygrepresult)
    (setq bds (xah-get-thing-at-cursor 'word))
    (setq myresult (elt bds 0) p1 (elt bds 1) p2 (elt bds 2))
    (setq mystr (replace-regexp-in-string "-" (rx "\\-") myresult))
    (grep (concat "grep -nHr -e '" myresult "'\\\\\\|^\\\\w.*\\( \\-\\-include='*.h' \\-\\-include='*.c' \\-\\-include='*.cpp' \\-\\-include='*.ovsschema' \\-\\-include='*.in' \\-\\-include='*.mib' | grep -B 1 '"  myresult "'")
          )))

(defun mygrep_file ()
  "grep function for grepint `xah-get-thing-at-cursor' "
  (interactive)
  (let (mygrepresult)
    (setq bds (xah-get-thing-at-cursor 'word))
    (setq myresult (elt bds 0) p1 (elt bds 1) p2 (elt bds 2))
    (setq mystr (replace-regexp-in-string "-" (rx "\\-") myresult))
    (grep (concat "grep -nHr -e '" myresult "'\\\\\\|^\\\\w.*\\( " (file-name-nondirectory (buffer-file-name)) " | grep -B 1 '"  myresult "'")
          )))

;; XML formatting
(defun remove-newlines-in-region ()
  "Removes all newlines in the region."
  (interactive)
  (save-restriction
    (narrow-to-region (point) (mark))
    (goto-char (point-min))
    (while (search-forward "\n" nil t) (replace-match "" nil t))))

(defun pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (remove-newlines-in-region)
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
      (backward-char) (insert "\n"))
    (indent-region begin end))
  (message "Ah, much better!"))

(defun org-link-describe (link desc)
  (if (file-exists-p link)
      desc
    (read-string "Description: " desc)))

(setf org-make-link-description-function #'org-link-describe)

(defvar *org-email-todo-tree-header* "*** Coding TODOS")
(defvar *org-email-todo-list-buffer* "~/backup/scratchpad/todo.org")

(defun org-insert-email-as-current-todo ()
  (interactive)
  (let ((link (org-store-link nil)))
    (save-window-excursion
      (find-file *org-email-todo-list-buffer*)
      (goto-char (point-min))
      (let ((point (re-search-forward *org-email-todo-tree-header* (point-max) 
                                      nil)))
        (org-end-of-subtree t)
        (insert "\n** TODO -- ")
        (insert link))))
  (org-save-all-org-buffers)
  (message "Saved."))

(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
(add-hook 'auto-save-hook 'my-desktop-save)

(defun emacs-process-p (pid)
  "If pid is the process ID of an emacs process, return t, else nil.
Also returns nil if pid is nil."
  (when pid
    (let ((attributes (process-attributes pid)) (cmd))
      (dolist (attr attributes)
        (if (string= "comm" (car attr))
            (setq cmd (cdr attr))))
      (if (and cmd (or (string= "emacs" cmd) (string= "emacs.exe" cmd))) t))))

(defadvice desktop-owner (after pry-from-cold-dead-hands activate)
  "Don't allow dead emacsen to own the desktop file."
  (when (not (emacs-process-p ad-return-value))
    (setq ad-return-value nil)))

;; simplenote
(setq simplenote2-email "carthique@gmail.com")
(setq simplenote2-password "Creative9!")
(simplenote2-setup)
(savehist-mode 1)

(defun magit-refs-ws0 ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat "" "~/ws0/panos/")))
    (magit-show-refs)))

(defun magit-refs-ws1 ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat "" "~/ws1/panos/")))
    (magit-show-refs)))

(defun magit-refs-ws2 ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat "" "~/ws2/panos/")))
    (magit-show-refs)))

(defun magit-refs-ws3 ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat "" "~/ws3/panos/")))
    (magit-show-refs)))

(defun magit-refs-ws4 ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat "" "~/ws4/panos/")))
    (magit-show-refs)))

(defun magit-refs-ws5 ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat "" "~/ws5/panos/")))
    (magit-show-refs)))

(defun magit-refs-ws6 ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat "" "~/ws6/panos/")))
    (magit-show-refs)))

(defun magit-refs-ws7 ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat "" "~/ws7/panos/")))
    (magit-show-refs)))

(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(defun mygid ()
  "grep function for grepint `xah-get-thing-at-cursor' "
  (interactive)
  (let (mygrepresult)
    (setq bds (xah-get-thing-at-cursor 'word))
    (gid (concat "gid " bds))))

(defun iedit-dwim (arg)
  "Starts iedit but uses \\[narrow-to-defun] to limit its scope."
  (interactive "P")
  (if arg
      (iedit-mode)
    (save-excursion
      (save-restriction
        (widen)
        ;; this function determines the scope of `iedit-start'.
        (if iedit-mode
            (iedit-done)
          ;; `current-word' can of course be replaced by other
          ;; functions.
          (narrow-to-defun)
          (iedit-start (current-word) (point-min) (point-max)))))))
(define-key global-map (kbd "s-;") 'iedit-dwim)

(add-hook 'simplenote2-note-mode-hook
          (lambda ()
            (local-set-key (kbd "s-s") 'simplenote2-sync-notes)))

(defun build-cscope ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat default-directory "../")))
    (bpr-spawn "build-cscope-local")))

;; use ansi-color-apply-on-region function on output buffer
(setq bpr-colorize-output t)

(defun my/unhighlight-all-in-buffer ()
  "Remove all highlights made by `hi-lock' from the current buffer.
The same result can also be be achieved by \\[universal-argument] \\[unhighlight-regexp]."
  (interactive)
  (unhighlight-regexp t))

(defun vc-root-dir ()
  (let ((backend (vc-deduce-backend)))
    (and backend
         (ignore-errors
           (vc-call-backend backend 'root default-directory)))))
(defun test-func ()
  (interactive)
  (message (concat "depth " (f-long(vc-root-dir)))))


(defun git-grep-prompt ()
  (let* ((default (current-word))
         (prompt (if default
                     (concat "Search for: (default " default ") ")
                   "Search for: "))
         (search (read-from-minibuffer prompt nil nil nil nil default)))
    (if (> (length search) 0)
        search
      (or default ""))))

(defun git-grep (search)
  "git-grep the entire current repo"
  (interactive (list (git-grep-prompt)))
  (grep-find (concat "git --no-pager grep -H -P -n --extended-regexp -I --break --show-function -e "
                     (shell-quote-argument search)
                     " `git rev-parse --show-toplevel`")))

(defun git-grep-local (search)
  "git-grep the current dir from current repo"
  (interactive (list (git-grep-prompt)))
  (grep-find (concat "git --no-pager grep -H -P -n --extended-regexp -I --break --show-function -e "
                     (shell-quote-argument search))))

(setq jiralib-url "http://mvjira.mv.usa.alcatel.com:8080")

;; Trigger completion immediately.
;;(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
;;(setq company-show-numbers t)

;; Use the tab-and-go frontend.
;; Allows TAB to select and complete at the same time.
;;(company-tng-configure-default)
;;(setq company-frontends
;;      '(company-tng-frontend
;;        company-pseudo-tooltip-frontend
;;        company-echo-metadata-frontend))

;; Reset the startup screen
(setq frame-title-format "%b - emacs")
(message "Welcome to Emacs!")

(cond ((eq system-type 'darwin)
       (toggle-frame-maximized)
       (add-to-list 'default-frame-alist '(fullscreen . maximized))
       (set-face-attribute 'default nil :height 140)
       )
)

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(setenv "GOPATH" "/Users/carthique/go/bin")
(add-to-list 'exec-path "/Users/carthique/go/bin")

(defun compile-go ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat default-directory "./")))
    (compile "go build -v && go test -v && go vet")))

(defun run-go ()
  (interactive)
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat default-directory "./")))
    (compile (concat "go run " (buffer-name)))))

(defun my-go-mode-hook ()
  ;;(auto-complete-mode 1)
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
;  (if (not (string-match "go" compile-command))
;      (set (make-local-variable 'compile-command)
;           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (setq indent-tabs-mode nil)
  (smart-tab-mode nil)
  (local-set-key [f9]    'compile-go)
  (local-set-key [C-f9]  'run-go)
  (local-set-key "\M-g"  'go-guru-definition)
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)

;;(with-eval-after-load 'go-mode
;;   (require 'go-autocomplete))
(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)

(defun go-run-buffer()
  (interactive)
  (shell-command (concat "go run " (buffer-name))))

;;(add-hook 'go-mode-hook 'go-eldoc-setup)
(setq leetcode-prefer-language "c")
(setq leetcode-prefer-sql "mysql")

(setq elpy-rpc-virtualenv-path 'current)
(elpy-enable)

;; Enable Flycheck
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable autopep8
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'elpy-mode-hook 'pylint-add-menu-items)
(add-hook 'elpy-mode-hook 'pylint-add-key-bindings)
(add-hook 'python-mode-hook 'pylint-add-menu-items)
(add-hook 'python-mode-hook 'pylint-add-key-bindings)
