;; -*- no-byte-compile: t; -*-
;;; lisp/packages.el

;; doom.el
(package! auto-minor-mode :pin "17cfa1b54800fdef2975c0c0531dad34846a5065")
(package! gcmh :pin "0089f9c3a6d4e9a310d0791cf6fa8f35642ecfd9")
(package! explain-pause-mode
  :recipe (:host github
           :repo "lastquestion/explain-pause-mode")
  :pin "2356c8c3639cbeeb9751744dbe737267849b4b51")

;; doom-packages.el
(package! straight
  :type 'core
  :recipe `(:host github
            :repo "radian-software/straight.el"
            :branch ,straight-repository-branch
            :local-repo "straight.el"
            :files ("straight*.el"))
  :pin "fed215348076ba9182f634e0770a175220474b5a")

;; doom-modules.el
(package! use-package
  :type 'core
  :pin "0ad5d9d5d8a61517a207ab04bf69e71c081149eb")

;; doom-ui.el
(package! all-the-icons :pin "b18db6be0a290e8f91fd8d8340b2b44c8b75049a")
(package! hide-mode-line :pin "bc5d293576c5e08c29e694078b96a5ed85631942")
(package! highlight-numbers :pin "8b4744c7f46c72b1d3d599d4fb75ef8183dee307")
(package! rainbow-delimiters :pin "a32b39bdfe6c61c322c37226d66e1b6d4f107ed0")
(package! restart-emacs :pin "1607da2bc657fe05ae01f7fdf26f716eafead02c")

;; doom-editor.el
(package! better-jumper :pin "47622213783ece37d5337dc28d33b530540fc319")
(package! dtrt-indent :pin "d4fd1b4977eb0d534844fddf01c3c51c70c57205")
(package! helpful :pin "94a07d49a80f66f8ebc54a49a4b4f6899a65fbe3")
(package! pcre2el :pin "0b5b2a2c173aab3fd14aac6cf5e90ad3bf58fa7d")
(package! smartparens :pin "8b6a3c3b31afd5b3f846e09859b5fc62eb06e7c1")
(package! ws-butler
  ;; Use my fork of ws-butler, which has a few choice improvements and
  ;; optimizations (the original has been abandoned).
  :recipe (:host github :repo "hlissner/ws-butler")
  :pin "572a10c11b6cb88293de48acbb59a059d36f9ba5")

;; doom-projects.el
(package! projectile :pin "dc6e7ff658789e4c6cf7c32a4b4fdf22ef9bc5a3")
(package! project :pin "2e8da1b811d5213bd143d9d036bf7ea14741a1ae")

;; doom-keybinds.el
(package! general :pin "9651024e7f40a8ac5c3f31f8675d3ebe2b667344")
(package! which-key :pin "1ab1d0cc88843c9a614ed3226c5a1070e32e4823")
