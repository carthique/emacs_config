(require 'package)
(setq server-quiet t)
(setq warning-minimum-level :emergency)
(setq byte-compile-warnings '(cl-functions))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(setq package-native-compile t)
(require 'package)

(defvar home_dir "/Users/kashankar/" "home directory")
(defvar org-directory (concat home_dir "Documents/notes/") "org notes directory")
;(defconst font_size_mac 250 "mac monitor")
;(defconst font_size_ws 250 "wide screen monitor")
(add-to-list 'load-path "~/.emacs.d/lisp/")
(setq inhibit-splash-screen t)         ; hide welcome screen
(require 'xcscope)
;;(require 'transient)
;(require 'kubectl)
(require 'f)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(connection-local-criteria-alist
   '(((:application tramp :protocol "flatpak")
      tramp-container-connection-local-default-flatpak-profile)
     ((:application tramp :machine "localhost")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp :machine "M-C02DV5D6MD6M")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp)
      tramp-connection-local-default-system-profile tramp-connection-local-default-shell-profile)
     ((:application eshell)
      eshell-connection-default-profile)))
 '(connection-local-profile-alist
   '((tramp-container-connection-local-default-flatpak-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin"))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state=abcde" "-o" "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (comm . 52)
       (state . 5)
       (ppid . number)
       (pgrp . number)
       (sess . number)
       (ttname . string)
       (tpgid . number)
       (minflt . number)
       (majflt . number)
       (time . tramp-ps-time)
       (pri . number)
       (nice . number)
       (vsize . number)
       (rss . number)
       (etime . tramp-ps-time)
       (pcpu . number)
       (pmem . number)
       (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o" "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "stat=abcde" "-o" "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (user . string)
       (group . string)
       (comm . 52)
       (state . 5)
       (ppid . number)
       (pgrp . number)
       (ttname . string)
       (time . tramp-ps-time)
       (nice . number)
       (etime . tramp-ps-time)
       (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o" "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ" "-o" "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format
       (pid . number)
       (euid . number)
       (user . string)
       (egid . number)
       (group . string)
       (comm . 52)
       (state . string)
       (ppid . number)
       (pgrp . number)
       (sess . number)
       (ttname . string)
       (tpgid . number)
       (minflt . number)
       (majflt . number)
       (time . tramp-ps-time)
       (pri . number)
       (nice . number)
       (vsize . number)
       (rss . number)
       (etime . number)
       (pcpu . number)
       (pmem . number)
       (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh")
      (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile
      (path-separator . ":")
      (null-device . "/dev/null"))
     (eshell-connection-default-profile
      (eshell-path-env-list))))
 '(custom-safe-themes
   '("bcc6775934c9adf5f3bd1f428326ce0dcd34d743a92df48c128e6438b815b44f" "68d36308fc6e7395f7e6355f92c1dd9029c7a672cbecf8048e2933a053cf27e6" "400994f0731b2109b519af2f2d1f022e7ced630a78890543526b9342a3b04cf1" default))
 '(exec-path-from-shell-arguments '("-c"))
 '(global-evil-search-highlight-persist t)
 '(gnutls-algorithm-priority "normal:-vers-tls1.3")
 '(magit-commit-arguments '("--all"))
 '(magit-diff-arguments nil)
 '(magit-fetch-arguments '("--prune"))
 '(magit-pull-arguments nil)
 '(package-selected-packages
   '(realgud counsel lsp-mode python-pytest pytest org-bullets kubernetes-tramp helm-projectile projectile org-roam-ui websocket helm helm-net flymake-python flymake-python-pyflakes dired-git-info sublimity pylint blacken elpy leetcode dockerfile-mode docker go-eldoc k8s-mode kubernetes yaml-mode neotree go-guru go-autocomplete exec-path-from-shell go-complete exwm xah-replace-pairs dired xeu_elisp_util xfrp_find_replace_pairs use-package company-tabnine string-inflection org-jira dumb-jump scp ssh fzf dash s py-autopep8 multi-compile git bpr magit-org-todos magit-filenotify magit expand-region iedit auto-complete-c-headers yasnippet auto-compile ibuffer-git hungry-delete hydandata-light-theme pt wgrep avy igrep zenburn-theme xah-find thingatpt+ sudo-edit smex smart-tab rainbow-delimiters material-theme leuven-theme highlight hc-zenburn-theme gotham-theme git-timemachine gh dired-toggle-sudo atom-dark-theme anzu alert ac-alchemist))
 '(warning-suppress-log-types '((comp) (comp)))
 '(warning-suppress-types '((comp))))
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'dired)

(require 'use-package-ensure)
(setq use-package-always-ensure t)
(setq backup-directory-alist
      `((".*" . (concat home_dir ".saves"))))
(setq auto-save-file-name-transforms
      `((".*" (concat home_dir ".saves") t)))
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; (defun fontify-frame (frame)
;;   (interactive)
;;   (if window-system
;;       (progn
;;         (if (> (x-display-pixel-height) 1440)
;;             (set-face-attribute 'default nil :height font_size_ws)
;;          (set-face-attribute 'default nil :height font_size_mac)))))

;; ;; Fontify current frame
;; (fontify-frame nil)

;; Fontify any future frames
;;(push 'fontify-frame after-make-frame-functions)
;; Set default font size to 16


(setq x-select-request-type 'STRING)
(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
;(run-with-idle-timer 0.1 nil 'toggle-fullscreen)
(set-cursor-color "#ffffff")
;(set-face-attribute 'default nil :height font_size_ws)

;; Any add to list for package-archives (to add marmalade or melpa) goes here
;; (add-to-list 'package-archives
;;              '("MELPA" .
;;                "http://melpa.milkbox.net/packages/"))

;(require 'p4)
;(require 'vc-p4)
(require 'thingatpt+)

;; Start of base packages
(use-package xah-get-thing :defer t)
(require 'xah-get-thing)
;; Enable base emacs packages
(use-package thingatpt :defer t)
(use-package xah-replace-pairs :defer t)
(use-package desktop :defer t)
(use-package whitespace :defer t)
(use-package expand-region :defer t)
(use-package bpr :defer t)
(use-package f :defer t)
(use-package hungry-delete :defer t)
(use-package smart-tab :defer t)
(use-package zenburn-theme :defer t)
(use-package smex :defer t)
(use-package rainbow-delimiters :defer t)
(use-package dumb-jump :defer t)
(use-package wgrep :defer t)
(use-package grep-a-lot :defer t)
(use-package anzu :defer t)
(use-package magit :defer t)
(use-package docker :defer t)
(use-package helm :defer t)
(use-package realgud :defer t)
(setq yas-verbosity 1)
(use-package k8s-mode :ensure t
                      :hook (k8s-mode . yas-minor-mode))
(use-package websocket
  :after org-roam)
(use-package projectile
  :defer t
  :config
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
  (projectile-mode +1))
(use-package helm-projectile
  :defer t
  :config
  (helm-projectile-on))
(use-package org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))
(use-package minibuf-isearch :defer t)
(use-package password-generator :defer t)
(use-package org-bullets :defer t)
(use-package org-roam
  :after org
  :init (setq org-roam-v2-ack t) ;; Acknowledge V2 upgrade
  :custom
  (org-roam-directory (file-truename org-directory))
  :config
  (org-roam-setup)
  :bind (("C-x n f" . org-roam-node-find)
         ("C-x n r" . org-roam-node-random)
         (:map org-mode-map
               (("C-x n i" . org-roam-node-insert)
                ("C-x n c" . org-id-get-create)
                ("C-x n t" . org-roam-tag-add)
                ("C-x n a" . org-roam-alias-add)
                ("C-x n l" . org-roam-buffer-toggle)))))
;; (use-package org-roam
;;   :ensure t
;;   :custom
;;   (org-roam-directory (file-truename org_notes))
;;   :bind (("C-x n l" . org-roam-buffer-toggle)
;;          ("C-x n f" . org-roam-node-find)
;;          ("C-x n g" . org-roam-graph)
;;          ("C-x n i" . org-roam-node-insert)
;;          ("C-x n c" . org-roam-capture)
;;          ;; Dai[[id:3A0BBC11-A3B6-40D3-8C84-DC03D37E3CC2][Deault]]lies
;;          ("C-x n j" . org-roam-dailies-capture-today))
;;   :config
;;   ;; If you're using a vertical completion framework, you might want a more informative completion interface
;;   (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
;;   (org-roam-db-autosync-mode)
;;   ;; If using org-roam-protocol
;;   (require 'org-roam-protocol))
(use-package kubernetes
  :ensure t
  :commands (kubernetes-overview)
  :config)
  ;;(setq kubernetes-poll-frequency 3600
        ;;kubernetes-redraw-frequency 3600))
(use-package exec-path-from-shell
  :ensure t
  :config
  (custom-set-variables
 '(exec-path-from-shell-arguments '("-c")))
  (exec-path-from-shell-initialize))
;; End of base packages

;; (setq gc-cons-threshold (* 100 1024 1024))
;; (setq read-process-output-max (* 1024 1024)) ; 1 MB
(setenv "PYTHONPATH" "/Users/kashankar/code/patches:/Users/kashankar/code/saas-infra/src/apps/orchestrator:/Users/kashankar/code/saas-infra/src/apps/lambda")
(setenv "LC_ALL" "C")
;;(setenv "PATH" "/Users/kashankar/.pyenv/shims:/Users/kashankar/bin:/usr/local/bin:/Users/kashankar/.local/bin:/Users/kashankar/bin:/usr/local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin")
(setq python-shell-extra-pythonpaths '("/Users/kashankar/code/saas-infra/src/apps/orchestrator/:/Users/kashankar/code/saas-infra/src/apps/lambda"))
(setenv "AWS_REGION" "us-west-2") 

(require 'k8s-mode)
;;(require 'company-tabnine)

;;Appearance and Functionality
(set-face-font 'default "MonoLisa")
(set-face-attribute 'default nil :height 180)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
;Make sure the following VNC settings are on
; - Do not send special keys
; - Set Options keys to Super_L
; - Set Cmd keys to Alt_L

;(setq mac-option-key-is-meta nil)
;(setq mac-command-key-is-meta t)

;; the following 4 lines work on mac book 16
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; the following 4 lines used to work with newer emacs, maybe!
;;(setq mac-option-key-is-meta nil)
;;(setq mac-command-key-is-meta t)
;;(setq mac-command-modifier 'control)
;;(setq mac-option-modifier 'super)

;;; No Menubar, Toolbar and Scrollbar
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
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
(setq cscope-option-do-not-update-database t)
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
(setq whitespace-line-column 120)
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
;;Show number of matches in mode-line while searching
(global-anzu-mode +1)
;; Smart tabs
(global-smart-tab-mode 1)
;; Themes
;;(load-theme 'material t)
;;(load-theme 'dark-laptop t)
(load-theme 'zenburn t)
(add-hook 'org-mode-hook #'org-bullets-mode)

;; (use-package lsp-mode
;;   :hook (python-mode . lsp-deferred)
;;   :commands (lsp lsp-deferred)
;;   :config
;;   (setq lsp-pyls-server-command "pylsp")
;;   (setq lsp-idle-delay 0.500)
;;   (setq lsp-python-ms-executable "/Users/kashankar/.pyenv/shims/pylsp"))


;; (require 'lsp-mode)
;; (add-hook 'python-mode-hook #'lsp-deferred)
;; (setq lsp-pylance-server-command '("pylance-language-server"))
;; (setq lsp-root-uri (concat "file://" (expand-file-name "/Users/kashankar/code/saas-infra")))

;(use-package lsp-pyright
;  :ensure t
;  :hook (python-mode . (lambda ()
;                          (require 'lsp-pyright)
;                          (lsp))))  ; or lsp-deferred

;(add-hook 'go-mode-hook 'lsp-deferred)

; PDB
;; Define a function to insert the pdb code snippet
(defun insert-pdb-debugger ()
  "Insert the pdb debug code snippet."
  (interactive)
  (insert "import pdb; pdb.set_trace()"))

;; Define a keyboard shortcut for the function
(global-set-key [s-f2] 'insert-pdb-debugger)


(use-package go-mode :defer t)
(use-package go-autocomplete :defer t)
(use-package go-guru :defer t)
(use-package flymake
  :ensure t
  :config
  (setq-default flymake-diagnostic-functions nil
                flymake-highlight-line nil
                flymake-start-on-flymake-mode nil))
;;(use-package flymake-go :defer t)
;;(use-package flymake-python-pyflakes :defer t)
(use-package go-eldoc :defer t)
(use-package dockerfile-mode :defer t)
(use-package elpy :defer t)
;;(use-package flycheck :defer t)
;;(setq elpy-rpc-python-command "/Users/kashankar/.pyenv/shims/python")
(use-package python
  :mode ("\\.py" . python-mode)
  :ensure t
  :config
  (flymake-mode) ;; <- This line makes the trick of disabling flymake in python mode!
  (use-package elpy
    :ensure t
    :init
    (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
    :config
    (remove-hook 'elpy-modules 'elpy-module-flymake) ;; <- This removes flymake from elpy
    (setq elpy-rpc-backend "jedi")
    :bind (:map elpy-mode-map
              ("M-." . elpy-goto-definition)
              ("M-," . pop-tag-mark))
  )
  (elpy-enable)
)

(use-package py-autopep8 :defer t)
(use-package blacken :defer t)
(use-package pylint :defer t)
(use-package avy :defer t)
(use-package sublimity :defer t)
;;(use-package company-tabnine :ensure t)
(use-package pytest :ensure t)
(use-package python-pytest :ensure t)
;;company-tabnine
;;(add-to-list 'company-backends #'company-tabnine)
;; Trigger completion immediately.
(setq company-idle-delay 0)
;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)
;;Diff mode hooks
(add-hook 'diff-mode-hook
          (lambda () (local-set-key (kbd "C-d") 'diff-split-hunk)))

;; Python
;; (use-package ace-isearch :defer t)
;; (global-ace-isearch-mode +1)
;; (use-package isearch-symbol-at-point :defer t)
;; (require 'isearch-symbol-at-point)

(avy-setup-default)
(global-set-key (kbd "C-c C-j") 'avy-resume)

(autoload 'pylint "pylint")
(add-hook 'python-mode-hook 'pylint-add-menu-items)
(add-hook 'python-mode-hook 'pylint-add-key-bindings)
(add-to-list 'auto-mode-alist '("\\.in\\'" . python-mode))


(autoload 'gid "idutils" nil t)
;(ac-config-default)

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
  (define-key c-mode-map "\C-c \C-s" 'org-insert-email-as-current-todo)
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
(global-set-key [M-f1]    (lambda() (interactive)(find-file (concat org-directory "20220610135225-default.org"))))
(global-set-key [M-f2]    (lambda() (interactive)(find-file (concat org-directory "20221011202643-todos.org"))))
;(global-set-key [C-f1]    'p4-opened)
(global-set-key [f1] 'my-helm-stackoverflow-lookup)
;;(global-set-key [M-f1]  (lambda() (interactive)(dired "~/backup/scratchpad/")))
(global-set-key [f2]    'goto-line)
(global-set-key [M-f2]  'match-paren)
;(global-set-key [C-f2] (lambda() (interactive)(set-face-attribute 'default nil :height font_size_ws)))
;(global-set-key [M-f2] (lambda() (interactive)(set-face-attribute 'default nil :height font_size_mac)))
(global-set-key [f3]    'magit-status)
(global-set-key [f4]    'magit-show-refs)
(global-set-key [f5]    'my-revert-buffer)
(global-set-key [M-f5]  'vc-revert)
(global-set-key [f6]    'magit-blame-addition)
(global-set-key [M-f6]  'git-timemachine)
(global-set-key [f7]    'magit-log-buffer-file)
(global-set-key [f8]    'magit-log-current)
(global-set-key [M-f8]  'magit-log-all-branches)
(global-set-key [f9]    'org-roam-node-find)
;(global-set-key [f10]   (lambda() (interactive)(find-file (concat home_dir "backup/scratchpad/ut.org"))))
(global-set-key [f12]   'open-emacs-file)
(global-set-key [M-f12] 'load-emacs)
(global-set-key [f13]  'open-log-file)
(global-set-key (kbd "C-Q") 'er/expand-region)
(global-set-key (kbd "C-f") 'avy-goto-char-timer)
;(global-set-key (kbd "M-<up>") 'beginning-of-defun)
;(global-set-key (kbd "M-<down>") 'end-of-defun)
;(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key [f11] 'org-roam-dailies-goto-today)
(global-set-key [M-f11] 'org-roam-dailies-goto-tomorrow)
(global-set-key [C-f11] 'org-roam-dailies-goto-yesterday)
(global-set-key [s-f11] 'roam-org-collate-dailies-into-weeklies)


(global-set-key (kbd "M-0") 'magit-refs-ws0)
(global-set-key (kbd "M-1") 'magit-refs-ws1)
(global-set-key (kbd "M-2") 'magit-refs-ws2)
(global-set-key (kbd "M-3") 'magit-refs-ws3)
(global-set-key (kbd "M-4") 'magit-refs-ws4)
(global-set-key (kbd "M-5") 'magit-refs-ws5)
(global-set-key (kbd "M-6") 'magit-refs-ws6)
(global-set-key (kbd "M-7") 'magit-refs-ws7)

;; control key bindings
(global-set-key [M-s-up] 'beginning-of-buffer)
(global-set-key [M-s-down] 'end-of-buffer)
;(global-set-key [M-C-up] 'forward-list)
;(global-set-key [M-C-down] 'backward-up-list)
;(global-set-key [M-up] 'beginning-of-defun)
;(global-set-key [M-down] 'end-of-defun)
;(global-set-key [\C-\s-up] 'backward-up-list)
;(global-set-key [\C-\s-down] 'forward-list)
(global-set-key "\C-x\C-x" 'buffer-menu)
(global-set-key "\C-c\C-x" 'pretty-print-xml-region)
(global-set-key [(control x) (k)] 'kill-this-buffer)

(global-set-key "\C-x\C-a" 'fzf)
(global-set-key "\M-z" 'toggle-frame-fullscreen)
(define-key cua-global-keymap [C-return] 'org-open-at-point)

(setq dumb-jump-fallback-search nil)
;; Meta Key bindings
(global-set-key "\M-s"      'mygrep_git_all)
(global-set-key "\M-d"      'mygrep)
(global-set-key "\M-g"       'mygrep_def_all)
(global-set-key "\M-a"      'mygrep_code_all)
(global-set-key "\M-f"      'mygrep_file)
(global-set-key "\C-d"       'vc-diff)
(global-set-key (kbd "s-d")   'vc-root-diff)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Super Key bindings
(global-set-key (kbd "s-s") 'git-grep)
(global-set-key (kbd "s-f") 'git-grep-local)
;;(global-set-key (kbd "s-d") 'mygrep)
(global-set-key [s-down] 'next-error)
(global-set-key [s-up] 'previous-error)
;(global-set-key [s-down] 'smerge-next)
;(global-set-key [s-up] 'smerge-prev)
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
;;(global-set-key (kbd "s-d") (lambda() (interactive)(write-file "~/patch.diff")))
(global-set-key (kbd "s-w") 'gid)
;(global-set-key (kbd "s-<left>")  'grep-a-lot-goto-prev)
;(global-set-key (kbd "s-<right>") 'grep-a-lot-goto-next)
(global-set-key [s-tab] 'avy-goto-char-timer)
(global-set-key (kbd "C-s-s") 'sudo-edit-current-file)
;;(global-set-key (kbd "s-c") 'string-inflection-lower-camelcase)
;;(global-set-key (kbd "s-g") 'simplenote2-sync-notes)


;; Function Definitions
(defun load-emacs ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun my-revert-buffer ()
  "Revert buffer without confirmation."
  (interactive) (delete-other-windows) (revert-buffer t t) (redraw-display))

(setq compile-command "")

(defun compile-lambda ()
  (interactive)
  (setenv "PAN_BUILD_DIR"
          (concat
           (f-long(vc-root-dir))
           )
          )
  (let ((inhibit-read-only t)))
  (let ((default-directory
          (concat (vc-root-dir) "src/apps/lambda")))
    (compile "make")))

;; (defun compile-both-in-parent-directory ()
;;   (interactive)
;;   (let ((inhibit-read-only t)))
;;   (let ((default-directory
;;           (concat default-directory "../")))
;;     (compile "mk dctor.both.i386")))

;; (defun compile-hops-in-parent-directory ()
;;   (interactive)
;;   (let ((inhibit-read-only t)))
;;   (let ((default-directory
;;           (concat default-directory "../")))
;;     (compile "mk dctor.both.hops")))

;; (defun compile-cpm-in-parent-directory ()
;;   (interactive)
;;   (let ((inhibit-read-only t)))
;;   (let ((default-directory
;;           (concat default-directory "../")))
;;     (compile "mk 7xxx.cpm.i386")))

;; (defun compile-all-in-parent-directory ()
;;   (interactive)
;;   (let ((inhibit-read-only t)))
;;   (let ((default-directory
;;           (concat default-directory "../")))
;;     (compile "mk cpm dctor.both.i386 dctor.boot.i386")))

;; (defun compile-everything-in-parent-directory ()
;;   (interactive)
;;   (let ((inhibit-read-only t)))
;;   (let ((default-directory
;;           (concat default-directory "../")))
;;     (compile "mk")))

;; (defun compile-x86-in-parent-directory ()
;;   (interactive)
;;   (let ((inhibit-read-only t)))
;;   (let ((default-directory
;;           (concat default-directory "../")))
;;     (compile "mk dctor.both.x86")))

(defun open-log-file ()
  (interactive)
  (find-file (concat home_dir "screen_log")))

(defun open-emacs-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun match-paren (arg)
  "Go to the matching parenthesis if on parenthesis otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(defvar root_dir)

(defun vc-root-dir ()
  (let ((backend (vc-deduce-backend)))
    (and backend
         (ignore-errors
           (vc-call-backend backend 'root default-directory)))))

(defun mygrep_git_all ()
  "grep function for grepint `xah-get-thing-at-cursor' "
  (interactive)
  (my-tell-user-about-directory)
  (let (mygrepresult)
    (setq myresult (tap-thing-at-point-as-string 'sexp))
    (setq myresult (read-string (format "Grep in branch (%s): " myresult)
                                nil nil myresult))
    ;; Escape special characters in myresult
    (setq myresult (replace-regexp-in-string "[\"\\]" "\\\\\\&" myresult))
    (let ((git-root (vc-git-root default-directory)))
      (if git-root
          (setq default-directory git-root)
        (setq default-directory "~/code"))
      (grep-find (concat "find . -type d \\( -name appportal -o -name test_coverage -o -name htmlcov \\) -prune -o -type f -size -2M -cmin -9999999 -exec grep -I -sn -e \"" myresult "\"\\\\\\|^\\\\w'.\*'\\( '{}' + | grep -B 1 \"" myresult "\""))
      )))

(defun mygrep_def_all ()
  "grep function for grepint `xah-get-thing-at-cursor' "
  (interactive)
  (my-tell-user-about-directory)
  (let (mygrepresult)
    (setq myresult (tap-thing-at-point-as-string 'sexp))
    (setq myresult (read-string (format "Grep for definition (%s): " myresult)
                                nil nil myresult))
    ;; Escape special characters in myresult
    (setq myresult (replace-regexp-in-string "[\"\\]" "\\\\\\&" myresult))
    (let ((git-root (vc-git-root default-directory)))
      (if git-root
          (setq default-directory git-root)
        (setq default-directory "~/code"))
      (grep-find (concat "find . -type d \\( -name appportal -o -name test_coverage -o -name htmlcov \\) -prune -o -type f -size -2M -cmin -9999999 -exec grep -I -sn -e '^\\(def \\|class \\)' \"" myresult "\"\\\\\\|^\\\\w'.\*'\\( '{}' + | grep -B 1 \"" myresult "\""))
      )))

(defun mygrep_code_all ()
  "grep function for grepint `xah-get-thing-at-cursor' "
  (interactive)
  (my-tell-user-about-directory)
  (let (mygrepresult)
    (setq myresult (tap-thing-at-point-as-string 'sexp))
    (setq myresult (read-string (format "Grep all code (%s): " myresult)
                                nil nil myresult))
    ;; Escape special characters in myresult
    (setq myresult (replace-regexp-in-string "[\"\\]" "\\\\\\&" myresult))
    (let ((original-default-directory default-directory) (default-directory "~/code"))
      (grep-find (concat "find . -type d \\( -name appportal -o -name test_coverage -o -name htmlcov \\) -prune -o -type f -size -2M -cmin -9999999 -exec grep -I -sn -e \"" myresult "\"\\\\\\|^\\\\w'.\*'\\( '{}' + | grep -B 1 \"" myresult "\""))
;      (message (format "current: %s" default-directory))
;      (message (format "original: %s" original-default-directory))
      (setq default-directory original-default-directory))))

(defun mygrep ()
  "grep function for grepint `xah-get-thing-at-cursor' "
  (interactive)
  (let (mygrepresult)
    (setq myresult (tap-thing-at-point-as-string 'sexp))
    (setq myresult (read-string (format "Grep in directory (%s): " myresult)
                                nil nil myresult))
    (grep-find (concat "find . -type d \\( -name appportal -o -name test_coverage -o -name htmlcov \\) -prune -o -type f -size -2M -cmin -9999999 -exec grep -I -sn -e \"" myresult "\"\\\\\\|^\\\\w'.\*'\\( '{}' + | grep -B 1 \"" myresult "\""))
    ))

;; (defun mygrep_file ()
;;   "grep function for grepint `xah-get-thing-at-cursor' "
;;   (interactive)
;;   (let (mygrepresult (filename (buffer-file-name)))
;;     (setq myresult (tap-thing-at-point-as-string 'sexp))
;;     (setq myresult (read-string (format "Grep in file (%s): " myresult)
;;                                 nil nil myresult))
;;     (grep-find (concat "grep -H -I -sn -e \"" myresult "\"\\\\\\|^\\\\w'.\*'\\( " filename " | grep -B 1 \"" myresult "\""))
;;     ))

(defun mygrep_file ()
  "grep function for grepint `xah-get-thing-at-cursor' "
  (interactive)
  (let ((filename (buffer-file-name))
        (myresult (tap-thing-at-point-as-string 'sexp)))
    (setq myresult (read-string (format "Grep in file (%s): " myresult)
                                nil nil myresult))
    (let ((grep-command (concat "grep -H -I -sn -e \"" myresult "\"\\\\\\|^\\\\w'.*'\\( " filename " | grep -B 1 \"" myresult "\"")))
      (compilation-start grep-command 'grep-mode)
      (with-current-buffer "*grep*"
        (goto-char (point-min))
        (while (re-search-forward myresult nil t)
          (add-text-properties (match-beginning 0) (match-end 0)
                               '(face highlight)))))
    ))

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
(defvar *org-email-todo-list-buffer* (concat org-directory "20220610135225-default.org"))

(defun org-insert-email-as-current-todo ()
  (interactive)
  (let ((link (org-store-link nil)))
    (save-window-excursion
      (find-file *org-email-todo-list-buffer*)
      (goto-char (point-min))
      (let ((point (re-search-forward *org-email-todo-tree-header* (point-max) 
                                      nil)))
        (org-end-of-subtree t)
        (insert "\n- [ ] -- ")
        (insert link))))
  (org-save-all-org-buffers)
  (message "Saved."))

(defun my-desktop-save ()
  (interactive)
  ;; Don't call desktop-save-in-desktop-dir, as it prints a message.
  (if (eq (desktop-owner) (emacs-pid))
      (desktop-save desktop-dirname)))
;;(add-hook 'auto-save-hook 'my-desktop-save)

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
;;(simplenote2-setup)
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
                     (shell-quote-argument (concat search ""))
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
;(message "Welcome to Emacs!")

;; (cond ((eq system-type 'darwin)
;;        (toggle-frame-maximized)
;;        (add-to-list 'default-frame-alist '(fullscreen . maximized))
;;        ;;(set-face-attribute 'default nil :height font_size_ws)
;;        )
;; )

;; (defun set-exec-path-from-shell-PATH ()
;;   (let ((path-from-shell (replace-regexp-in-string
;;                           "[ \t\n]*$"
;;                           ""
;;                           (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
;;     (setenv "PATH" path-from-shell)
;;     (setq eshell-path-env path-from-shell) ; for eshell users
;;     (setq exec-path (split-string path-from-shell path-separator))))

;; (when window-system (set-exec-path-from-shell-PATH))

(setenv "GOPATH" "/Users/kashankar/go/bin")
(add-to-list 'exec-path "/Users/kashankar/go/bin")
(add-to-list 'exec-path "/Users/kashankar/.pyenv/shims")
;(add-to-list 'exec-path "/Users/kashankar/.local/bin")
(add-to-list 'load-path "/place/where/you/put/it/")
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

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
  (setq indent-tabs-mode t)
  (tab-width 4)
  ;(local-set-key [f9]    'compile-go)
  (local-set-key [C-f9]  'run-go)
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)

;;(with-eval-after-load 'go-mode
;;   (require 'go-autocomplete))
(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)

(defun go-run-buffer()
  (interactive)
  (shell-command (concat "go run " (buffer-name))))

;;(add-hook 'go-mode-hook 'go-eldoc-setup)
;(setq leetcode-prefer-language "c")
;(setq leetcode-prefer-sql "mysql")
;(setq elpy-shell-use-project-root nil)

;;(elpy-enable)

;; Enable Flycheck
;;(when (require 'flycheck nil t)
;;(setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;(add-hook 'elpy-mode-hook 'flycheck-mode))

;; Enable autopep8
(require 'py-autopep8)
;(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(add-hook 'python-mode-hook
          (lambda ()
            (cscope-minor-mode)
            (setq indent-tabs-mode nil)
            (local-set-key (kbd "M-b")  'org-insert-email-as-current-todo)
            ;; (local-set-key "\s-s"      'cscope-find-this-symbol)
            ;; (local-set-key "\s-g"      'cscope-find-global-definition)
            ;; (local-set-key "\s-f"      'cscope-find-this-file)
            ;; (local-set-key "\s-i"      'cscope-find-files-including-file)
            (local-set-key (kbd "M-<up>") 'beginning-of-defun)
            (local-set-key (kbd "M-<down>") 'end-of-defun)
            (local-set-key [\C-\s-up] 'python-nav-backward-up-list)
            (local-set-key [\C-\s-down] 'python-nav-forward-list)
            (local-set-key (kbd "S-f")    'beginning-of-defun)
            (local-set-key (kbd "S-F")    'end-of-defun)
            (local-set-key (kbd "M-p")    'elpy-check)
            ;;(local-set-key (kbd "s-d") 'p4-diff)
            ;;(local-set-key [f9]    'compile-lambda)
            (local-set-key [f10]   'elpy-check)
            )
          )

(add-hook 'p4-mode-hook
          (lambda ()
            (local-set-key [f6]    'p4-annotate)
            )
          )

(defun my-tell-user-about-directory ()
  "Display the name of the directory containing the cscope database."
  (interactive)
  (let (info directory)
    (setq info (cscope-find-info nil))
    (if (= (length info) 1)
	(progn
	  (setq directory (car (car info)))
      (setq root_dir (car (car info)))
	  (message (concat "directory: " root_dir))
	  ))))


(defun test-func ()
  (interactive)
  (setq str (tap-thing-at-point-as-string 'sexp))
  (setq str (read-string (format "Grep (%s): " str)
                             nil nil str))
  (message (concat "depth " str)))

(defun test-file ()
  (interactive)
  (my-tell-user-about-directory)
  ;(kill-grep)
  (let ((default-directory
          (concat "" root_dir)))
    (if (file-exists-p "cscope.files")
        (message (concat "found " "cscope.files"));; if true
      (message (concat "not found " "cscope.files"));; if not
      )
    ;(highlight-phrase "test" "hi-yellow")
    ))


(defun myfind_dir_all ()
  "grep function for grepint `xah-get-thing-at-cursor' "
  (interactive)
  (my-tell-user-about-directory)
  ;(kill-grep)
  (let (mygrepresult)
    ;(setq bds (xah-get-thing-at-cursor 'word))
    ;(setq myresult (elt bds 0) p1 (elt bds 1) p2 (elt bds 2))
    (setq myresult (tap-thing-at-point-as-string 'sexp))
    (setq myresult (read-string (format "Find in branch (%s): " myresult)
                                nil nil myresult))
    (setq mystr (replace-regexp-in-string "-" (rx "\\-") myresult))
    (let ((default-directory
            (f-long(vc-root-dir))))
            ;(concat "" root_dir)))
      (if (file-exists-p "cscope.files")
          (grep (concat "cat cscope.files | xargs grep -I -sn -e '" myresult "'\\\\\\|^\\\\w'.\*'\\( . | grep -B 1 '"  myresult "'"))
        (grep (concat "find . -size -2M -cmin -9999999 | grep -v 'appportal' | xargs grep --exclude-dir=appportal -I -sn -e '" myresult "'\\\\\\|^\\\\w'.\*'\\( . | grep -B 1 '"  myresult "'"))
        )
      ;;(highlight-phrase myresult "hi-yellow")
      )))

(defun sudo-edit-current-file ()
  (interactive)
  (let ((my-file-name) ; fill this with the file to open
        (position))    ; if the file is already open save position
    (if (equal major-mode 'dired-mode) ; test if we are in dired-mode 
        (progn
          (setq my-file-name (dired-get-file-for-visit))
          (find-alternate-file (prepare-tramp-sudo-string my-file-name)))
      (setq my-file-name (buffer-file-name); hopefully anything else is an already opened file
            position (point))
      (find-alternate-file (prepare-tramp-sudo-string my-file-name))
      (goto-char position))))


(defun prepare-tramp-sudo-string (tempfile)
  (if (file-remote-p tempfile)
      (let ((vec (tramp-dissect-file-name tempfile)))
        (tramp-make-tramp-file-name
         "sudo"
         ""
         (tramp-file-name-domain vec)
         (tramp-file-name-host vec)
         (tramp-file-name-port vec)
         (tramp-file-name-localname vec)
         (format "ssh:%s@%s|"
                 (tramp-file-name-user vec)
                 (tramp-file-name-host vec))))
    (concat "sudo::" tempfile)))

(define-key dired-mode-map [s-return] 'sudo-edit-current-file)

(defun test-func1 ()
  (interactive)
  (setenv "PAN_BUILD_DIR"
          (concat
           (f-long(vc-root-dir))
           )
          )
  (message (getenv "PAN_BUILD_DIR"))
  )


(setq vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))

(defun join-lines () (interactive)
 (setq fill-column 100000)
 (fill-paragraph nil)
 (setq fill-column 78)
)

;;(advice-add 'anzu-mode :before #'test-file)

;; install helm via packages and then:

(require 'so)
(require 'helm-net)
(require 'cl-lib)

(defun my-helm-stackoverflow-lookup ()
  (interactive)
  ;; set debug-on-error to swallow potential network errors
  (let ((debug-on-error t)
        (helm-google-suggest-actions '(("Stackoverflow" . my-get-stackoverflow-answers))))
    (helm-google-suggest)))

(require 'git-mode)
;;(add-to-list 'auto-mode-alist '(concat ("" "\\'") . git-mode))


(when (fboundp 'git-mode)
  (defun my-git-config ()
    "For use in `git-mode-hook'."
    (local-set-key (kbd "M-d") 'mygrep)
    ;; more stuff here
    )
(add-hook 'git-mode-hook 'my-git-config))
(put 'narrow-to-region 'disabled nil)



(autoload 'sgml-skip-tag-backward "sgml-mode" nil t)
(autoload 'sgml-skip-tag-forward "sgml-mode" nil t)
(defun html-get-tag ()
  (let ((b (line-beginning-position))
        (e (line-end-position))
        (looping t)
        (html-tag-char (string-to-char "<"))
        (char (following-char))
        (p (point))
        (found_tag -1))

    (save-excursion
      ;; search backward
      (unless (= char html-tag-char)
        (while (and looping (<= b (point)) (not (= char 60)))
          (setq char (following-char))
          (setq p (point))
          (if (= p (point-min))
              ;; need get out of loop anyway
              (setq looping nil)
            (backward-char))))

      ;; search forward
      (if (not (= char html-tag-char))
          (save-excursion
            (while (and (>= e (point)) (not (= char 60)))
              (setq char (following-char))
              (setq p (point))
              (forward-char))))

      ;; is end tag?
      (when (and (= char html-tag-char) (< p e))
        (goto-char p)
        (forward-char)
        (if (= (following-char) 47)
            (progn
              ;; </
              (skip-chars-forward "^>")
              (forward-char)
              (setq p (point))
              (setq found_tag 1))
          (progn
            ;; < , looks fine
            (backward-char)
            (setq found_tag 0)))))
    found_tag))

(defun html-jump(&optional num)
  "Jump forward from html open tag"
  (interactive "P")
  (unless num (setq num 1))
  ;; web-mode-forward-sexp is assigned to forward-sexp-function
  ;; it's buggy in web-mode v11, here is the workaround
  (let ((backup-forward-sexp-function forward-sexp-function))
    (if (= (html-get-tag) 0)
        (sgml-skip-tag-forward num)
      (sgml-skip-tag-backward num))))

(define-key minibuffer-local-map
  (kbd "<insert>")
  (lambda ()
    (interactive)
    (if (string-match "[-a-z0-9 ]+$" (minibuffer-contents))
        (mapc (lambda (char)
                (push char unread-command-events))
              (reverse (match-string 0 (minibuffer-contents)))))
    (helm-minibuffer-history)))



 (setq org-latex-pdf-process
          '("latexmk -pdflatex='pdflatex -interaction nonstopmode' -pdf -bibtex -f %f"))



    (unless (boundp 'org-latex-classes)
      (setq org-latex-classes nil))

    (add-to-list 'org-latex-classes
                 '("ethz"
                   "\\documentclass[a4paper,11pt,titlepage]{memoir}
    \\usepackage[utf8]{inputenc}
    \\usepackage[T1]{fontenc}
    \\usepackage{fixltx2e}
    \\usepackage{graphicx}
    \\usepackage{longtable}
    \\usepackage{float}
    \\usepackage{wrapfig}
    \\usepackage{rotating}
    \\usepackage[normalem]{ulem}
    \\usepackage{amsmath}
    \\usepackage{textcomp}
    \\usepackage{marvosym}
    \\usepackage{wasysym}
    \\usepackage{amssymb}
    \\usepackage{hyperref}
    \\usepackage{mathpazo}
    \\usepackage{color}
    \\usepackage{enumerate}
    \\definecolor{bg}{rgb}{0.95,0.95,0.95}
    \\tolerance=1000
          [NO-DEFAULT-PACKAGES]
          [PACKAGES]
          [EXTRA]
    \\linespread{1.1}
    \\hypersetup{pdfborder=0 0 0}"
                   ("\\chapter{%s}" . "\\chapter*{%s}")
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))


    (add-to-list 'org-latex-classes
                 '("article"
                   "\\documentclass[11pt,a4paper]{article}
    \\usepackage[utf8]{inputenc}
    \\usepackage[T1]{fontenc}
    \\usepackage{fixltx2e}
    \\usepackage{graphicx}
    \\usepackage{longtable}
    \\usepackage{float}
    \\usepackage{wrapfig}
    \\usepackage{rotating}
    \\usepackage[normalem]{ulem}
    \\usepackage{amsmath}
    \\usepackage{textcomp}
    \\usepackage{marvosym}
    \\usepackage{wasysym}
    \\usepackage{amssymb}
    \\usepackage{hyperref}
    \\usepackage{mathpazo}
    \\usepackage{color}
    \\usepackage{enumerate}
    \\definecolor{bg}{rgb}{0.95,0.95,0.95}
    \\tolerance=1000
          [NO-DEFAULT-PACKAGES]
          [PACKAGES]
          [EXTRA]
    \\linespread{1.1}
    \\hypersetup{pdfborder=0 0 0}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")))


    (add-to-list 'org-latex-classes '("ebook"
                                      "\\documentclass[11pt, oneside]{memoir}
    \\setstocksize{9in}{6in}
    \\settrimmedsize{\\stockheight}{\\stockwidth}{*}
    \\setlrmarginsandblock{2cm}{2cm}{*} % Left and right margin
    \\setulmarginsandblock{2cm}{2cm}{*} % Upper and lower margin
    \\checkandfixthelayout
    % Much more laTeX code omitted
    "
                                      ("\\chapter{%s}" . "\\chapter*{%s}")
                                      ("\\section{%s}" . "\\section*{%s}")
                                      ("\\subsection{%s}" . "\\subsection*{%s}")))


(defun my-apply-patch (start end)
  "Apply a patch from the selected region using the patch command-line tool."
  (interactive "r")
  (let* ((patch-content (buffer-substring-no-properties start end))
         (patch-file (make-temp-file "patch"))
         (output-buffer (generate-new-buffer "*Patch Output*")))
    (with-temp-file patch-file
      (insert patch-content))
    (shell-command-on-region start end (format "patch -p0 --forward < %s" patch-file) output-buffer)
    (switch-to-buffer output-buffer)))

(global-set-key (kbd "C-c a") 'my-apply-patch)

(defun get-file-dir-or-home ()
  "If inside a file buffer, return the directory, else return home"
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
     "~/"
     (file-name-directory filename))))

(defun iterm-goto-filedir-or-home ()
  "Go to present working dir and focus iterm"
  (interactive)
  (do-applescript
   (concat
    " tell application \"iTerm2\"\n"
    "   tell the current session of current window\n"
    (format "     write text \"cd %s\" \n" (get-file-dir-or-home))
    "   end tell\n"
    " end tell\n"
    " do shell script \"open -a iTerm\"\n"
    ))
  )

(defun iterm-focus ()
  (interactive)
  (do-applescript
   " do shell script \"open -a iTerm\"\n"
   ))

;; (defun roam-org-collate-dailies-into-weeklies ()
;;   "Collate daily notes from the last 7 days into a weekly note."
;;   (interactive)
;;   (let* ((num-days (read-number "Enter number of days: ")) ; Ask user for number of days
;;          (end-date (format-time-string "%Y-%m-%d"))
;;          (start-date (format-time-string "%Y-%m-%d" (time-subtract (current-time) (days-to-time 10))))
;;         daily-files
;;         weekly-file
;;         (content "")) ; Initialize content as an empty string
;;     ;; Iterate through the last 7 days and collect daily files
;;     (dotimes (i 10)
;;       (let* ((date (format-time-string "%Y-%m-%d" (time-subtract (current-time) (days-to-time i))))
;;              (daily-file (concat org-roam-directory "daily/" date ".org")))
;;         (message (concat "here " daily-file))
;;         (when (file-exists-p daily-file)
;;           (message (concat"here " daily-file))
;;           (setq daily-files (append daily-files (list daily-file))))))
;;     (setq weekly-file (format "%s/week-of-%s-to-%s.org" org-roam-directory start-date end-date))
;;     ;; Iterate through daily files and collect content
;;     (dolist (file daily-files)
;;       (with-temp-buffer
;;         (insert-file-contents file)
;;         (goto-char (point-min))
;;         ;; Skip everything before the end of the header
;;         (when (search-forward "END:" nil t)
;;           (forward-line 1))
;;         (setq content (concat content "\n" (buffer-substring (point) (point-max))))))
;;     ;; Create or open the weekly file
;;     (find-file weekly-file)
;;     (goto-char (point-max))
;;     (insert content)
;;     (save-buffer)
;;     (message "Weekly note created for %s to %s" start-date end-date)))

(defun roam-org-collate-dailies-into-weeklies ()
  "Collate daily notes from the last 7 days into a weekly note."
  (interactive)
  (let* ((num-days (read-number "Enter number of days: ")) ; Ask user for number of days
         (end-date (format-time-string "%Y-%m-%d"))
         (start-date (format-time-string "%Y-%m-%d" (time-subtract (current-time) (days-to-time 10))))
        daily-files
        weekly-file
        (content "")) ; Initialize content as an empty string
    ;; Iterate through the last 7 days and collect daily files
    (dotimes (i 10)
      (let* ((date (format-time-string "%Y-%m-%d" (time-subtract (current-time) (days-to-time i))))
             (daily-file (concat org-roam-directory "daily/" date ".org")))
        (message (concat "here " daily-file))
        (when (file-exists-p daily-file)
          (message (concat"here " daily-file))
          (setq daily-files (append daily-files (list daily-file))))))
    (setq weekly-title (format "Weekly Status %s-to-%s" start-date end-date))
    ;; Iterate through daily files and collect content
    (setq content (concat content weekly-title "\n"))
    (dolist (file daily-files)
      (with-temp-buffer
        (insert-file-contents file)
        (goto-char (point-min))
        ;; Skip everything before the end of the header
        (when (search-forward "END:" nil t)
          (forward-line 1))
        (setq content (concat content "\n" (buffer-substring (point) (point-max))))))
    ;; Create or open the weekly Org-roam note
;;     (org-roam-capture- :keys "w"
;;                        :node (org-roam-node-create :title weekly-title)
;;                        :templates '(("w" "weekly" plain (function org-roam-capture--get-point)
;;                                      "%?"
;;                                      :file-name "weeklies/${slug}"
;;                                      :head "#+title: ${title}\n\n"
;;                                      :unnarrowed t))
;;                        :target (file+head "weeklies/${slug}.org" "#+title: ${title}\n\n")
;; )
    ;; Create or open the weekly Org-roam note
    (org-roam-node-find "Weekly")
    (goto-char (point-max))
    (insert content)
    (save-buffer)
    (message "Weekly note created for %s to %s" start-date end-date)))

;; (defun my-git-grep-in-directory (directory search-term)
;;   "Search for SEARCH-TERM using 'git grep' in all Git repositories within one level of DIRECTORY."
;;   (interactive "DDirectory: \nsSearch for: ")
;;   (let ((buffer-name (generate-new-buffer-name "*git-grep-results*")))
;;     (with-current-buffer (get-buffer-create buffer-name)
;;       (my-git-grep-in-directory-helper directory search-term))
;;     (pop-to-buffer buffer-name)))

;; (defun my-git-grep-in-directory-helper (directory search-term)
;;   "Helper function to search for SEARCH-TERM using 'git grep' in all Git repositories within one level of DIRECTORY."
;;   (message (format "Searching in directory: %s" directory))
;;   (dolist (file (directory-files directory t))
;;     (when (and (file-directory-p file)
;;                (not (string-suffix-p "." (file-name-nondirectory file)))
;;                (not (string-suffix-p ".." (file-name-nondirectory file))))
;;       (let ((default-directory file))
;;         (message (format "Checking directory: %s" default-directory))
;;         (if (file-exists-p (expand-file-name ".git" file))
;;             (progn
;;               (message (format "Searching in Git repository: %s" default-directory))
;;               (shell-command (format "git grep -n '%s'" search-term) t)))))))

;; (global-set-key (kbd "C-c g") 'my-git-grep-in-directory)

(defun my-git-grep-in-directory (directory search-term)
  "Search for SEARCH-TERM using 'git grep' in all Git repositories within one level of DIRECTORY."
  (interactive "DDirectory: \nsSearch for: ")
  (let ((buffer-name (generate-new-buffer-name "*git-grep-results*"))
        (default-directory directory)
        (base-path-length (length (expand-file-name directory))))
    (with-current-buffer (get-buffer-create buffer-name)
      (my-git-grep-in-directory-helper directory search-term base-path-length))
    (pop-to-buffer buffer-name)))

(defun my-git-grep-in-directory-helper (directory search-term base-path-length)
  "Helper function to search for SEARCH-TERM using 'git grep' in all Git repositories within one level of DIRECTORY."
  (message (format "Searching in directory: %s" directory))
  (dolist (file (directory-files directory t))
    (when (and (file-directory-p file)
               (not (string-suffix-p "." (file-name-nondirectory file)))
               (not (string-suffix-p ".." (file-name-nondirectory file))))
      (let ((default-directory file))
        (if (file-exists-p (expand-file-name ".git" file))
            (progn
              (message (format "Searching in Git repository: %s" default-directory))
              (let ((grep-command (format "git grep -n '%s'" search-term)))
                (let ((output (shell-command-to-string grep-command)))
                  (with-temp-buffer
                    (insert output)
                    (goto-char (point-min))
                    (while (re-search-forward "\\(.*\\):\\([0-9]+\\):\\(.*\\)$" nil t)
                      (let* ((matched-path (match-string 1))
                             (line-number (match-string 2))
                             (match-text (match-string 3))
                             (relative-path (substring matched-path base-path-length)))
                        (delete-region (match-beginning 0) (match-end 0))
                        (insert (format "%s:%s:%s\n" relative-path line-number match-text))))))))
          (my-git-grep-in-directory-helper file search-term base-path-length))))))

(global-set-key (kbd "C-c g") 'my-git-grep-in-directory)

(defun python-percent-to-f-string ()
  "Convert Python % string formatting to f-strings."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "%[0-9]*[.]?[0-9]*[l]?[+-]?[ 0#]*[0-9]*\\([diouxXeEfFgGcrsa%]\\)" nil t)
      (let ((replacement (match-string 1)))
        (cond
         ((string-match-p "[diouxX]" replacement)
          (replace-match (concat "%" replacement) nil nil nil 1))
         ((string-match-p "[eEfFgG]" replacement)
          (replace-match (concat "%.2f" replacement) nil nil nil 1))
         ((string= replacement "c")
          (replace-match (concat "%c") nil nil nil 1))
         ((string= replacement "r")
          (replace-match (concat "%r") nil nil nil 1))
         ((string= replacement "s")
          (replace-match (concat "%s") nil nil nil 1))
         ((string= replacement "%")
          (replace-match (concat "%%") nil nil nil 1)))))
    (goto-char (point-min))
    (while (re-search-forward "%\\([0-9]+\\)\\$\\([diouxXeEfFgGcrsa%]\\)" nil t)
      (let* ((arg-number (string-to-number (match-string 1)))
             (replacement (match-string 2)))
        (cond
         ((string-match-p "[diouxX]" replacement)
          (replace-match (concat "%" (number-to-string arg-number) replacement) nil nil nil 2))
         ((string-match-p "[eEfFgG]" replacement)
          (replace-match (concat "%" (number-to-string arg-number) ".2f" replacement) nil nil nil 2))
         ((string= replacement "c")
          (replace-match (concat "%" (number-to-string arg-number) "c") nil nil nil 2))
         ((string= replacement "r")
          (replace-match (concat "%" (number-to-string arg-number) "r") nil nil nil 2))
         ((string= replacement "s")
          (replace-match (concat "%" (number-to-string arg-number) "s") nil nil nil 2))
         ((string= replacement "%")
          (replace-match (concat "%" (number-to-string arg-number) "%%") nil nil nil 2)))))
    (message "Python % string formatting converted to f-strings.")))

(grep-a-lot-setup-keys)

