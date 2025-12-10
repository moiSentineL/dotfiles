;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "nibirsan"
      user-mail-address "nibir@nibirsan.org")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "Pragmasevka Nerd Font" :size 18)
      doom-variable-pitch-font (font-spec :family "Manrope" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-sourcerer)

(set-frame-parameter nil 'alpha-background 85) ; For current frame
(add-to-list 'default-frame-alist '(alpha-background . 85)) ; For all new frames henceforth

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.

(setq display-line-numbers-type nil)
(global-display-line-numbers-mode -1)


(setq-default vterm-shell
      "/usr/bin/fish") 
(setq-default explicit-shell-file-name
      "/usr/bin/fish")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; -- org + org-roam

(setq org-directory "~/docs/org/")
(setq org-agenda-files '("~/docs/org/agenda.org" "~/docs/org/inbox.org" "~/docs/org/notes.org"))

(use-package! org-modern
  :after org
  ;; :hook (org-mode . org-modern-mode)
  :custom
  (org-modern-star nil)
  (org-modern-hide-stars t)
  (org-modern-table nil)
  (org-modern-ellipsis " ? "))

(setq
    org-auto-align-tags nil
    org-tags-column 0
    org-catch-invisible-edits 'show-and-error
    org-special-ctrl-a/e t
    org-insert-heading-respect-content t

    ;; Org styling, hide markup etc.
    org-hide-emphasis-markers t
    org-pretty-entities t
    org-agenda-tags-column 0
    org-ellipsis "…")

(use-package org-roam
  :after org
  :ensure t
  :custom
  (org-roam-directory (file-truename "~/docs/org/notes/"))
  (org-roam-dailies-directory "../journal/")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))


(use-package! org-roam-ui
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

(setq org-roam-capture-templates
	'(("n" "notes" plain
	    "\n* About\n %?"
	    :target (file+head "${slug}.org"
				"#+title: ${title}\n")
	    :immediate-finish t
	    :unnarrowed t)
	    )
	)

(setq org-roam-dailies-capture-templates
      '(("d" "daily scratchpad & tasks" plain
         ,(concat
           "* Todo's for %<%Y-%m-%d>\n"
           "** Core [ / ]\n"
           "- [ ] day XX\n"
           "- [ ] %?\n"
           "- [ ] Workout - P/P/L\n"
           "\n"
           "** Any >= 3\n"
           "\n"
           "*** Menial Slave Labour\n"
           "- [ ] \n"
           "\n"
           "*** Maintenance / Debugging\n"
           "- [ ] \n"
           "\n"
           "* Scratchpad\n"
           "** Ideas\n"
           "\n"
           "** Any weird stuff\n"
           "\n")
         :target (file+head
                  "%<%Y-%m-%d>.org"
                  "#+title: %<%Y-%m-%d>\n")
         :immediate-finish t
         :unnarrowed t)))
 
(setq org-capture-templates
      '(("t" "Daily Capture" entry
         (file+headline "~/docs/org/inbox.org" "Inbox") ; Target the Inbox file
         "* TODO %?\n  %i\n  %a")))

(after! org-download
      (setq org-download-method 'directory)
      (setq org-download-image-dir "~/docs/org/files/")
      (setq org-download-image-org-width 600)
      (setq org-download-link-format "[[file:%s]]\n"
        org-download-abbreviate-filename-function #'file-relative-name)
      (setq org-download-link-format-function #'org-download-link-format-function-default))

;; -- latex
(setq org-startup-with-inline-images t)

(setq org-preview-latex-default-process 'dvisvgm)
(setq org-latex-create-formula-image-program 'dvisvgm)
;;(setq org-format-latex-options (plist-put org-format-latex-options :scale 2))
(setq org-latex-preview-threshold 1.0)

;; -- keybinds

(map! "C-M-n" #'evil-window-left
      "C-M-i" #'evil-window-right
      "C-M-u" #'evil-window-up
      "C-M-e" #'evil-window-down)

;; -- custom functions

(defun nb/copy-leak-tracker-to-clipboard ()
  "Open today's journal, find 'Leak Tracker', export subtree as text, copy to clipboard."
  (interactive)
  (require 'org)
  (require 'org-journal)

  ;; open and switch to today's journal
  (org-journal-open-current-journal-file)

  (goto-char (point-min))

  ;; manually use isearch to find the heading
  (isearch-forward "Leak Tracker")
  (isearch-exit)

  (unless (org-at-heading-p)
    (org-back-to-heading))

  (let* ((subtree (org-element-at-point))
         (raw (buffer-substring-no-properties
               (org-element-property :begin subtree)
               (org-element-property :end subtree)))
         ;; ascii backend = plain UTF-8 text
         (exported (org-export-string-as raw 'ascii t)))
    (kill-new exported)
    (message "Leak Tracker copied. Go fix your leaks, champ.")))
