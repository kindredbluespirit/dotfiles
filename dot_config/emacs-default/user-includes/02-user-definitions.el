(setq prefix (getenv "IDENTITY"))

(defmacro setq-neo (sym val)
  (list 'setq (intern (concat prefix "-" (symbol-name sym))) val))
(put 'setq-neo 'function-documentation
  (concat "like `setq', except when sym is passed, \ndefines " prefix "-sym instead"))

(defmacro evalq-neo (sym)
  (intern (concat prefix "-" (symbol-name sym))))
(put 'evalq-neo 'function-documentation
  (concat "like `eval', except when sym is passed, \nevaluates \'" prefix "-sym (with the quote) instead"))

(defmacro defun-neo (name arglist &optional docstring &rest body)
  (list 'defalias
    (list 'intern (list 'concat 'prefix "-" (symbol-name name)))
    (append (list 'lambda arglist (eval docstring)) body)))
(put 'defun-neo 'function-documentation 
  (concat "like `defun', except when func-name is passed, defines " prefix "-func-name instead, \nalso, docstring is evaluated unlike in defun, where it is taken as-is"))

(defmacro funcall-neo (name &rest arglist)
  (append (list 'funcall (list 'intern (list 'concat 'prefix "-" (symbol-name name)))) arglist))
(put 'funcall-neo 'function-documentation
  (concat "like `funcall', except when func-name is passed, calls " prefix "-func-name instead"))

(defun-neo order-unique-region (beg end)
  "sort the region's lines in the lexical order, \nthen remove the duplicates"
  (interactive "r")
  (sort-lines nil beg end)
  (delete-duplicate-lines beg end nil t))

(defun-neo order-unique ()
  "sort the whole buffer's lines in the lexical (dictionary) order, \nthen remove the duplicates"
  (interactive)
  (funcall-neo order-unique-region (point-min) (point-max)))

(defun-neo replace-string (from-string to-string)
  "like `replace-string', but for the whole buffer"
  (interactive (concat "sReplace string: \nsReplace string " from-string " with "))
  (replace-string from-string to-string nil (point-min) (point-max) nil nil))

(defun create-scratch-buffer nil
    "create a scratch buffer"
    (interactive)
    (switch-to-buffer (get-buffer-create "*scratch*"))
    (insert initial-scratch-message)
    (lisp-interaction-mode))

(provide '02-user-definitions)