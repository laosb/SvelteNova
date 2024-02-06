# `build_scripts`

Both `compile_parser.sh` and `Makefile` are provided by Panic
[on their doc site](https://docs.nova.app/syntax-reference/tree-sitter/#compiling-a-parser),
and may be retrieved from
[here](https://docs.nova.app/syntax-reference/build_script.zip).

## Building

Assuming you have Nova.app installed at `/Applications/Nova.app`, run
`npm run build:tree-sitter` to build `libtree-sitter-svelte.dylib`. This command is
also included in `npm run build`.

If you installed Nova.app elsewhere, run `build_parser.sh` (from project root)
to build, specifying the path to Nova.app as the first argument:

```sh
./build_scripts/build_parser.sh /Applications/Nova.app
```

It will also copy the build output to correct place and cleanup temp files.

## Signing

The resulting library must be signed to be able to submit to Nova's library.

Assuming you already built the library, and your Developer ID certificate is
installed to Login keychain, use `npm run sign:tree-sitter CERT_ID` to sign the
library.
