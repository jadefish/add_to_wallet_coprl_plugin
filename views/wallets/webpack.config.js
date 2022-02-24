const path = require('path')

const env = process.env.NODE_ENV || 'development'

console.log(`* Environment: ${env}`)

module.exports = {
  mode: env,

  entry: './src/index.ts',
  output: {
    path: path.join(__dirname, 'dist'),
    filename: 'bundle.js',
    publicPath: '/',
    library: {
      // tell bundle.js to store index.ts's default export as `window.AddToWallet`.
      // (this is required for COPRL to properly hydrate/update add_to_wallet plugin elements)
      export: 'default',
      type: 'window',
      name: 'AddToWallet'
    }
  },

  module: {
    rules: [
      {test: /\.js$/, exclude: /node_modules/, use: ['babel-loader']},
      {test: /\.ts$/, exclude: /node_modules/, use: ['ts-loader']}
    ]
  },
  resolve: {
    extensions: ['.js', '.ts']
  }
}
