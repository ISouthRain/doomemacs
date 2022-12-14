;;; app/wanderlust/config.el -*- lexical-binding: t; -*-

(use-package! wl
  :defer t
  :config
  (setq mail-user-agent 'wl-user-agent
        pgg-scheme 'gpg
        mime-edit-split-message nil)

  (when (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))

  (setq wl-demo nil
        wl-stay-folder-window t
        wl-init-file (expand-file-name "wl.el" doom-user-dir)
        wl-folders-file (expand-file-name "folders.wl" doom-user-dir))

  (setq wl-message-truncate-lines t
        wl-summary-width 120
        wl-message-ignored-field-list
        '(".*Received:"
          ".*Path:"
          ".*Id:"
          "^References:"
          "^Replied:"
          "^Errors-To:"
          "^Lines:"
          "^Sender:"
          ".*Host:"
          "^Xref:"
          "^Content-Type:"
          "^Precedence:"
          "^Status:"
          "^X.*:"
          "^MIME.*:"
          "^In-Reply-To:"
          "^Content-Transfer-Encoding:"
          "^List-.*:")
        wl-message-visible-field-list
        '("^Message-Id:"
          "^User-Agent:"
          "^X-Mailer:"
          "^X-Face:"))

  (when (modulep! +gmail)
    (setq elmo-imap4-default-server "imap.gmail.com"
          elmo-imap4-default-port 993
          elmo-imap4-default-authenticate-type 'clear ; CRAM-MD5
          elmo-imap4-default-user user-mail-address
          elmo-imap4-default-stream-type 'ssl
          elmo-imap4-set-seen-flag-explicitly t)

    (setq wl-smtp-connection-type 'starttls
          wl-smtp-posting-port 587
          wl-smtp-authenticate-type "plain"
          wl-smtp-posting-user user-mail-address
          wl-smtp-posting-server "smtp.gmail.com"
          wl-local-domain "gmail.com")

    (setq wl-default-folder "%inbox"
          wl-draft-folder "%[Gmail]/Drafts"
          wl-trash-folder "%[Gmail]/Trash"
          wl-fcc-force-as-read t
          wl-default-spec "%"))

  (setq wl-message-id-domain wl-local-domain)

  (when (modulep! :editor evil)
    ;; Neither `wl-folder-mode' nor `wl-summary-mode' are correctly defined as
    ;; major modes, so we cannot use `set-evil-initial-state!' here.
    ;; In addition, `wl-folder-mode' won't start in `evil-emacs-state' through
    ;; `evil-emacs-state-modes', and `wl-summary-mode' won't start in
    ;; `evil-emacs-state' through `wl-summary-mode-hook'.
    (add-hook! 'wl-folder-mode-hook #'evil-emacs-state)
    (pushnew! evil-emacs-state-modes 'wl-summary-mode))

  (add-hook 'mime-edit-mode-hook #'auto-fill-mode))
