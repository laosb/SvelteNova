const commonjs = require('@rollup/plugin-commonjs')
const { nodeResolve } = require('@rollup/plugin-node-resolve')
const typescript = require('@rollup/plugin-typescript')

module.exports = {
  input: 'src/main.ts',

  plugins: [typescript(), commonjs(), nodeResolve()],

  output: {
    file: 'SvelteNova.novaextension/Scripts/main.js',
    format: 'cjs',
    exports: 'auto',
  },
}
