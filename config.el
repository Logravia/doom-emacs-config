;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jānis Alunāns"
      user-mail-address "j.alunans@gmail.com")

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
(setq doom-font (font-spec :family "monospace" :size 20 :weight 'semi-light)
       doom-variable-pitch-font (font-spec :family "monospace" :size 20))

;;font family was sans replaced to monospace

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-ayu-mirage)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Org")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 't)

;;      CUSTOM CONFIG

;; Makes org-mode titles larger.
(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.2))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.1))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
  )

(global-visual-line-mode t)

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      truncate-string-ellipsis "…"                ; Unicode ellispis are nicer than "...", and also save /precious/ space
      password-cache-expiry nil                   ; I can trust my computers ... can't I?
      ;; scroll-preserve-screen-position 'always     ; Don't have `point' jump around
      scroll-margin 2)

(global-subword-mode 1)                           ; Iterate through CamelCase words

(setq-default major-mode 'org-mode) ;;By default open files in Org mode.

;; For nov to function.
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
;; Makes sure the day is monday.
(setq calendar-week-start-day 1)
(setq recentf-max-saved-items 300)
;; The lower the number the more often you have repeat the cards
(setq org-drill-learn-fraction 0.35)
(setq org-drill-add-random-noise-to-intervals-p t)
;; Sets the pomodoro sound
(setq org-pomodoro-finished-sound "/home/higravia/Bin/beep.wav")
(setq org-pomodoro-short-break-sound  "/home/higravia/Bin/beep.wav")
(setq org-pomodoro-short-break-sound-p "/home/higravia/Bin/beep.wav")
(setq org-pomodoro-length 20)
(setq org-pomodoro-short-break-length 8)

(map! :leader
      :desc "Multiedit-replace"
      "r" #'evil-multiedit-match-all)

(setq +zen-text-scale 0)

(after! org
        (add-to-list 'org-capture-templates
                '("c" "Code"  entry
                  (file "~/Org/code")
                  "* Card :drill:\n%?\n** Code\n%i\n%l" :empty-lines 1))
  )
;;(setq-default mode-line-format nil)
;;(setq-default inhibit-splash-screen t)
;;(setq-default hl-line-mode
;;Does not complete quotes
(sp-pair "'" nil :actions :rem)
(sp-pair "\"" nil :actions :rem)
;;(setq-default header-line-format " ")
;;(set-frame-parameter nil 'internal-border-width 10)
;; leader means the space
;; desc is merely the description
;; Quotes contain the keys
;; After # is the command
;;(map! :leader
;;      :desc "Close buffer"
;;      "ESC" #'doom/switch-to-scratch-buffer)

;; Here are some additional functions/macros that could help you configure Doom:
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
