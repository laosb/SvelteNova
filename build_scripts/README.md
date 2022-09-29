# `build_scripts`

Both `compile_parser.sh` and `Makefile` are provided by Panic
[on their doc site](https://docs.nova.app/syntax-reference/tree-sitter/#compiling-a-parser),
and may be retrieved from
[here](https://docs.nova.app/syntax-reference/build_script.zip).

Run `build_parser.sh` (from project root) to build the
`tree-sitter-svelte.dylib`:

```sh
./build_scripts/build_parser.sh /Applications/Nova.app
```

You may need to adjust the path to `Nova.app`. It will also copy the build
output to correct place and cleanup temp files.
