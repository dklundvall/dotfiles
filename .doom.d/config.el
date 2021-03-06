;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "Source Code Variable" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory (expand-file-name "~/.local/share/Nextcloud/Documents/org/"))
(setq org-agenda-files (quote ("~/.local/share/Nextcloud/Documents/org")))
;;      (format "%s/%s" org-directory "cal_inbox.org")
;;      (format "%s/%s" org-directory "cal_personal_inbox.org")
;;      (format "%s/%s" org-directory "cal_work_inbox.org")
;;      (format "%s/%s" org-directory "notes_work.org")
;;      (format "%s/%s" org-directory "notes_personal.org")
;;      )

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


; Here are some additional functions/macros that could help you configure Doom:
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
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; ---------------- CALDAV -------------------------
(setq org-caldav-url "https://emma.cloud.tabdigital.eu/remote.php/dav/calendars/dklundvall@tuta.io")
(setq org-caldav-calendars
      '((:calendar-id "personal"
                      :inbox "~/.local/share/Nextcloud/Documents/org/cal_personal.org")
    (:calendar-id "outlookoffice365com"
                      :inbox "~/.local/share/Nextcloud/Documents/org/cal_work.org")))
(setq org-caldav-backup-file "~/.local/share/Nextcloud/Documents/org/org-caldav-backup.org")
(setq org-caldav-save-directory "~/.local/share/Nextcloud/Documents/org")

(setq elfeed-feeds
      '(("https://ultralightandcomfortable.com/feed/" 
     "https://hikinginfinland.com/atom.xml" 
     "https://forum.manjaro.org/c/announcements.rss" 
     "https://forum.manjaro.org/c/announcements/stable-updates.rss" 
     "https://itsfoss.com/feed/" 
     "https://www.archlinux.org/feeds/news/")))

