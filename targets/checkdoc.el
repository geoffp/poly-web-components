
(let ((sentence-end-double-space)
      (checkdoc-arguments-in-order-flag)
      (checkdoc-verb-check-experimental-flag)
      (checkdoc-force-docstrings-flag))
  (let ((files (directory-files default-directory nil "^[^.].*el$")))
    (dolist (f files)
      (unless (member f '("poly-web-components-autoloads.el"))
        (checkdoc-file f)))))
