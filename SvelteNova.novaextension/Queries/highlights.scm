; This query file is adopted from https://github.com/Himujjal/tree-sitter-svelte/blob/master/queries/highlights.scm.
; Nova's highlight captures are different from the original one.

; ((element (start_tag (tag_name) @_tag) (text) @text.title)
;  (#match? @_tag "^(h[0-9]|title)$"))
;
; ((element (start_tag (tag_name) @_tag) (text) @text.strong)
;  (#match? @_tag "^(strong|b)$"))
;
; ((element (start_tag (tag_name) @_tag) (text) @text.emphasis)
;  (#match? @_tag "^(em|i)$"))
;
; ((element (start_tag (tag_name) @_tag) (text) @text.strike)
;  (#match? @_tag "^(s|del)$"))
;
; ((element (start_tag (tag_name) @_tag) (text) @text.underline)
;  (#eq? @_tag "u"))
;
; ((element (start_tag (tag_name) @_tag) (text) @text.literal)
;  (#match? @_tag "^(code|kbd)$"))
;
; ((element (start_tag (tag_name) @_tag) (text) @text.uri)
;  (#eq? @_tag "a"))

((attribute
   (attribute_name) @_attr
   (quoted_attribute_value (attribute_value) @tag.attribute.value.link))
 (#match? @_attr "^(href|src)$"))

((attribute
    (attribute_name) @tag.attribute.name
    ["="]? @tag.attribute.operator
    [
      (attribute_value) @tag.attribute.value
      (quoted_attribute_value
        ["\"" "'"] @tag.attribute.value.delimiter.left
        (_)? @tag.attribute.value
        ["\"" "'"] @tag.attribute.value.delimiter.right
      )
    ]?
  )
  (#not-match? @tag.attribute.name "(?i)^(src|href)$")
)

(tag_name) @tag.name
(erroneous_end_tag_name) @invalid
(comment) @comment

(if_start_expr (special_block_keyword) @keyword.condition)
(else_expr (special_block_keyword) @keyword.condition)
(else_if_expr (special_block_keyword) @keyword.condition)
(if_end_expr (special_block_keyword) @keyword.condition)

[
  (special_block_keyword)
  (then)
  (as)
] @keyword

[
  "{"
  "}"
  ("{" "#")
  ("{" ":")
  ("{" "/")
  ("{" "@")
] @tag.framework.bracket

[
  "<"
  ">"
  "</"
  "/>"
] @tag.bracket
