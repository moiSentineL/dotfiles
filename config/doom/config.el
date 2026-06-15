;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "nibirsan"
      user-mail-address "poly@tilde.green")

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
(setq doom-font (font-spec :family "Iosevka" :size 18)
      doom-variable-pitch-font (font-spec :family "Atkinson Hyperlegible Next" :size 22)
      doom-big-font-increment 10)
;;
;; If You or Emacs can't find your font, use 'M-x describe-font' to look them
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

(after! org
  (setq org-directory "~/docs/org/"
        org-agenda-files '("~/docs/org/weekly.org")
        ;; org-agenda-files '("~/docs/org/agenda.org" "~/docs/org/inbox.org" "~/docs/org/notes.org" "~/docs/org/creative.org" "~/docs/org/life.org" "~/docs/org/academia.org")
        org-capture-templates '(
          ("t" "Daily Capture" entry
           (file+headline "~/docs/org/inbox.org" "Inbox") ; Target the Inbox file
         "* TODO %?\n  %i\n  %a")
          ("b" "Blog Post" plain
           (function my/blog-capture-template)
           ""
           :unnarrowed t
           :jump-to-captured t)
          )
        ))

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
    org-support-shift-select t
    org-agenda-tags-column 0
    org-ellipsis "…")

;; (use-package org-roam
;;   :after org
;;   :ensure t
;;   :custom
;;   (org-roam-directory (file-truename "~/docs/org/notes/"))
;;   (org-roam-dailies-directory "../journal/")
;;   :bind (("C-c n l" . org-roam-buffer-toggle)
;;          ("C-c n f" . org-roam-node-find)
;;          ("C-c n g" . org-roam-graph)
;;          ("C-c n i" . org-roam-node-insert)
;;          ("C-c n c" . org-roam-capture)
;;          ;; Dailies
;;          ("C-c n j" . org-roam-dailies-capture-today))
;;   :config
;;   ;; If you're using a vertical completion framework, you might want a more informative completion interface
;;   (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
;;   (org-roam-db-autosync-mode)
;;   ;; If using org-roam-protocol
;;   (require 'org-roam-protocol))


;; (use-package! org-roam-ui
;;     :after org-roam ;; or :after org
;; ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;; ;;         a hookable mode anymore, you're advised to pick something yourself
;; ;;         if you don't care about startup time, use
;; ;;  :hook (after-init . org-roam-ui-mode)
;;     :config
;;     (setq org-roam-ui-sync-theme t
;;           org-roam-ui-follow t
;;           org-roam-ui-update-on-save t
;;           org-roam-ui-open-on-start t))

;; (setq org-roam-capture-templates
;; 	'(("n" "notes" plain
;; 	    "\n* About\n %?"
;; 	    :target (file+head "${slug}.org"
;; 				"#+title: ${title}\n")
;; 	    :immediate-finish t
;; 	    :unnarrowed t)
;; 	    )
;; 	)

;; (setq org-roam-dailies-capture-templates
;;       '(("d" "daily scratchpad & tasks" plain
;;          ,(concat
;;            "* Todo's for %<%Y-%m-%d>\n"
;;            "** Core [ / ]\n"
;;            "- [ ] day XX\n"
;;            "- [ ] %?\n"
;;            "- [ ] Workout - P/P/L\n"
;;            "\n"
;;            "** Any >= 3\n"
;;            "\n"
;;            "*** Menial Slave Labour\n"
;;            "- [ ] \n"
;;            "\n"
;;            "*** Maintenance / Debugging\n"
;;            "- [ ] \n"
;;            "\n"
;;            "* Scratchpad\n"
;;            "** Ideas\n"
;;            "\n"
;;            "** Any weird stuff\n"
;;            "\n")
;;          :target (file+head
;;                   "%<%Y-%m-%d>.org"
;;                   "#+title: %<%Y-%m-%d>\n")
;;          :immediate-finish t
;;          :unnarrowed t)))
 

(use-package! org-download
  :after org
  :hook (org-mode . org-download-enable)
  :config
        (setq org-download-method 'directory)
        (setq org-download-image-dir "~/docs/org/files/")
        (setq org-download-screenshot-method 'xclip)
        (setq org-download-image-org-width 600)
        (setq org-download-link-format "[[file:%s]]\n"
        org-download-abbreviate-filename-function #'file-relative-name)
        (setq org-download-link-format-function #'org-download-link-format-function-default)

  )


;; -- latex
(setq org-startup-with-inline-images t)

(setq org-preview-latex-default-process 'dvisvgm)
(setq org-format-latex-options '(:scale 2 :background "Transparent"))
(setq org-latex-preview-threshold 1.0)

;; -- projects

(setq projectile-project-search-path '("~/.local/repos/" "~/docs/coding/" "~/docs/pages/"))

;; -- functions

(defun my/unicode-sans-italic-region (start end)
  "Convert region to Unicode sans-serif italics."
  (interactive "r")
  (let ((map
         (lambda (c)
           (cond
            ((and (>= c ?a) (<= c ?z)) (+ #x1D622 (- c ?a)))
            ((and (>= c ?A) (<= c ?Z)) (+ #x1D608 (- c ?A)))
            (t c)))))
    (save-excursion
      (goto-char start)
      (while (< (point) end)
        (let* ((c (char-after))
               (nc (funcall map c)))
          (delete-char 1)
          (insert-char nc))))))

(defun my/sanitize-filename (title)
  (replace-regexp-in-string
   "[/\\:*?\"<>|]" ""
   (replace-regexp-in-string
    "\\s+" "-"
    (string-trim title))))

(defun my/blog-capture-template ()
  (let* ((title     (read-string "Post title: "))
         (excerpt   (read-string "Excerpt: "))
         (tags-raw  (read-string "Tags (space-separated): "))
         (status    (completing-read "Status: " '("draft" "done" "published") nil t))
         (hero      (read-string "Hero image (leave blank to skip): "))
         (date-str  (format-time-string "%Y-%m-%dT%H:%M:%S"))
         (tz-raw    (format-time-string "%z"))
         ;; format +0530 → +05:30
         (tz-str    (concat (substring tz-raw 0 3) ":" (substring tz-raw 3)))
         (tags-yaml (mapconcat (lambda (tag) (concat "  - " tag))
                               (split-string tags-raw " " t)
                               "\n"))
         (fname     (my/sanitize-filename title))
         (filepath  (expand-file-name (concat fname ".md") my/blog-posts-dir)))
    (find-file filepath)
    (insert (format "---
tags:
%s
excerpt: %s
date: %s%s
status: %s
title: %s
heroImage: %s
---

"
                    tags-yaml excerpt date-str tz-str status title hero))))

(defvar my/blog-posts-dir "~/.local/repos/website/src/blog/")


;; -- keybinds

(map! :map org-mode-map
      :n "SPC TAB" #'org-toggle-narrow-to-subtree
      :n "C-S-u" #'outline-previous-heading
      :n "C-S-e" #'outline-next-heading)

(map! :g "C-M-n" #'evil-window-left
      :g "C-M-i" #'evil-window-right
      :g "C-M-u" #'evil-window-up
      :g "C-M-e" #'evil-window-down)

(map! :map elpher-mode-map
      :g "C-=" #'text-scale-increase
      :g "C--" #'text-scale-decrease)

(map! :leader
      :desc "Paste link with title"
      "i l" #'org-cliplink)

(map! :n "C-c I" #'my/unicode-sans-italic-region)

;; -- mail

;; (set-email-account! "tilde"
;;  '((smtpmail-smtp-user     . "poly@tilde.green"))
;;  t)

;; Configure the function to use for sending mail
(setq message-send-mail-function 'smtpmail-send-it)

(setq smtpmail-smtp-server "smtp.tilde.green"
      smtpmail-smtp-service 465
      smtpmail-stream-type  'ssl)

(setq mu4e-get-mail-command "mbsync tilde"
      ;; get emails and index every 5 minutes
      ;; mu4e-update-interval 300
      ;; send emails with format=flowed
      mu4e-compose-format-flowed t
      ;; no need to run cleanup after indexing for gmail
      mu4e-index-cleanup nil
      mu4e-index-lazy-check t
      ;; more sensible date format
      mu4e-headers-date-format "%d.%m.%y")

(setq mu4e-compose-signature "nibir")

;; (require 'org-mime)

;; (setq org-mime-prefer-html t)
;; (setq org-mime-export-options '(:with-latex dvipng))

;; (setq org-mime-export-options
;;       '(:section-numbers nil
;;         :with-author nil
;;         :with-toc nil))

;; (add-hook 'message-send-hook #'org-mime-htmlize)
;; (setq sendmail-program "/usr/sbin/msmtp"
;;       send-mail-function 'sendmail-send-it
;;       message-sendmail-f-is-evil t
;;       message-sendmail-envelope-from 'header
;;       message-send-mail-function 'message-send-mail-with-sendmail)
