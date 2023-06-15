;;; lsp-protobuf.el --- lsp client for protobuf with bufls  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Aaron Ji

;; Author: Aaron Ji <shuxiao9058@gmail.com>
;; Keywords: convenience, tools, protobuf
;; URL: https://github.com/shuxiao9058/lsp-protobuf
;; Version: 0.0.1
;; Package-Requires: ((emacs "25") (lsp-mode "8.0.0"))

;;
;; Permission is hereby granted, free of charge, to any person obtaining a copy
;; of this software and associated documentation files (the "Software"), to deal
;; in the Software without restriction, including without limitation the rights
;; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be included in all
;; copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.
;;
;;; Commentary:

;; lsp-protobuf client
;;

;;; Code:

(require 'lsp-mode)
(require 'lsp-completion)

(defgroup lsp-protobuf nil
  "LSP support for the protobuf Language, using the bufls language server."
  :link '(url-link "https://github.com/bufbuild/buf-language-server")
  :group 'lsp-mode
  :package-version '(lsp-mode . "6.3.2"))

(defcustom lsp-protobuf-bufls-server-path "bufls"
  "Path to bufls server binary."
  :type 'string
  :group 'lsp-protobuf)

(defcustom lsp-protobuf-bufls-server-args '("serve")
  "Extra CLI arguments for bufls."
  :type '(repeat string)
  :group 'lsp-protobuf)

(lsp-register-client
 (make-lsp-client :new-connection (lsp-stdio-connection
				   (lambda () (cons lsp-protobuf-bufls-server-path lsp-protobuf-bufls-server-args)))
                  :major-modes '(protobuf-mode)
                  :language-id "protobuf"
                  :priority 0
                  :server-id 'protobuf-bufls
                  :completion-in-comments? t))

(lsp-consistency-check lsp-protobuf)

(provide 'lsp-protobuf)
;;; lsp-protobuf.el ends here
