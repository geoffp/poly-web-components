;; CSS-in-JS mode for use in ${} blocks in CSS template strings
;; (define-hostmode poly-css-in-js-hostmode
;;   :mode 'scss-mode)

;; (define-innermode poly-css-in-js-innermode
;;   :mode 'js-mode
;;   :head-matcher "\\(\\${([^)]+) => \\(`[^`]+`\\|[^}]+\\)}\\)"
;;   :tail-matcher ";"
;;   :tail-mode 'host)

;; (define-polymode poly-css-in-js-mode
;;   :hostmode 'poly-css-in-js-hostmode
;;   :innermodes '(poly-css-in-js-innermode))




;; The main Web Components modes
(define-hostmode poly-web-components-hostmode
  :mode 'js-mode)

(define-hostmode poly-ts-web-components-hostmode
  :mode 'typescript-mode)

(define-innermode poly-web-components-css-innermode
  :mode 'css-mode
  :head-matcher "\\(styled.\\w+\\|css\\|keyframes\\)\\(<\\(.\\|\n\\)*?>\\)?`"
  :tail-matcher "`;"
  :allow-nested nil
  :head-mode 'host
  :tail-mode 'host)

(define-innermode poly-web-components-ts-innermode
  :mode 'typescript-mode
  :can-overlap t
  :allow-nested nil
  :head-matcher "\\${"
  :tail-matcher "};")

;; (define-innermode poly-web-components-js-in-template-innermode
;;   :mode 'typescript-mode
;;   ;; :head-matcher "\\(\\${([^)]+) => \\(?:`[^`]+`\\|[^}]+\\)}\\)"
;;   :head-matcher "\\${"
;;   :tail-matcher "};")

;; (define-innermode poly-web-components-css-in-js-innermode
;;   :mode 'poly-css-in-js-mode
;;   :head-matcher "\\(styled.\\w+\\|css\\|keyframes\\)\\(<\\(.\\|\n\\)*?>\\)?`"
;;   :tail-matcher "`"
;;   :head-mode 'host
;;   :tail-mode 'host)

(define-innermode poly-web-components-html-innermode
  :mode 'html-mode
  :head-matcher "\\(html\\( ?= ?\\)?`\\|\\.innerHTML\s*=\s*`\\)"
  :tail-matcher "`"
  :head-mode 'host
  :tail-mode 'host)



(define-polymode poly-web-components-mode
  :hostmode 'pm-host/js
  :innermodes '(poly-web-components-css-innermode
                 poly-web-components-html-innermode))

(define-polymode poly-ts-web-components-mode
  :hostmode 'poly-ts-web-components-hostmode
  :innermodes '(
                poly-web-components-css-innermode
                poly-web-components-html-innermode))
