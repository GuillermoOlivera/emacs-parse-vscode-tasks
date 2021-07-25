(require 'json)

(setq tasks ())

(let* ((json-object-type 'hash-table)
       (json-array-type 'list)
       (json-key-type 'string)
       (json (json-read-file "./.vscode/tasks-clean.json"))
       (projects (gethash "tasks" json)))
    (dolist (project projects)
        (setq task (cons (gethash "label" project) (gethash "command" project)) )
        (setq tasks (cons task tasks))
    )
)

(add-dir-local-variable nil 'multi-compile-alist (list (cons "\\.*" tasks)))

