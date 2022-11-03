; <style>
(
  (style_element
    (start_tag) @start
    (end_tag) @end
  )
  (#set! role tag)
)

; <script>
(
  (script_element
    (start_tag) @start
    (end_tag) @end
  )
  (#set! role tag)
)

; other HTML elements
(
  (element
    (start_tag) @start
    (end_tag) @end
  )
  (#set! role tag)
)

; {#if expr}
(
  (if_statement
    (if_start_expr) @start
    [
      (if_end_expr)
      (else_statement)
      (else_if_statement)
    ] @end
  )
  (#set! role block)
)

; {:else if expr}
(
  (else_if_statement
    (else_if_expr) @start
    [
      (if_end_expr)
      (else_statement)
      (else_if_statement)
    ] @end
  )
  (#set! role block)
)

; {:else} in {#if}
(
  (else_statement
    (else_expr) @start
    (if_end_expr) @end
  )
  (#set! role block)
)

; {#each}
(
  (each_statement
    (each_start_expr) @start
    [
      (else_each_statement)
      (each_end_expr)
    ] @end
  )
  (#set! role block)
)

; {:else} in {#each}
(
  (else_each_statement
    (else_expr) @start
    (each_end_expr) @end
  )
  (#set! role block)
)

; TODO: {#await expr}
