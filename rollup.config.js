import commonjs from '@rollup/plugin-commonjs'
import { nodeResolve } from '@rollup/plugin-node-resolve'
import typescript from '@rollup/plugin-typescript'

module.exports = {
  input: 'src/main.ts',

  plugins: [typescript(), commonjs(), nodeResolve()],

  output: {
    file: 'SvelteNova.novaextension/Scripts/main.js',
    format: 'cjs',
    exports: 'auto',
  },
}
