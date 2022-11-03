#!/bin/zsh

# This script is supposed to be ran from the project root.
# ./build_scripts/build_parser.sh path/to/Nova.app

NOVAAPP=$1

cp build_scripts/Makefile tree-sitter-svelte/

pushd tree-sitter-svelte
../build_scripts/compile_parser.sh . $NOVAAPP
popd

mv tree-sitter-svelte/build/lib/libtree-sitter-svelte.dylib SvelteNova.novaextension/Syntaxes/libtree-sitter-svelte.dylib

# Clean up the submodule folder to avoid problems
rm -rf tree-sitter-svelte/build
rm tree-sitter-svelte/Makefile
rm tree-sitter-svelte/libtree-sitter-svelte.dylib
