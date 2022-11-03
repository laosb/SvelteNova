; This query file is adopted from https://github.com/Himujjal/tree-sitter-svelte/blob/master/queries/injections.scm.
; Nova's injection captures are different from the original one.

(style_element
  (raw_text
    (#set! injection.language css)
  ) @injection.content
)

((attribute
   (attribute_name) @_attr
   (quoted_attribute_value (attribute_value (#set! injection.language css)) @injection.content))
 (#eq? @_attr "style")
)

(raw_text_expr
  (#set! injection.language javascript)
) @injection.content

(script_element
  (raw_text
    (#set! injection.language javascript)
  ) @injection.content
)

(script_element
	(start_tag
	  (attribute
      (attribute_name) @_attr
		  (quoted_attribute_value (attribute_value) @injection.language)
    )
  )
	(raw_text) @injection.content
  (#eq? @_attr "lang")
)
