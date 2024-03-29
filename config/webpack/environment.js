const { environment } = require('@rails/webpacker')
const VueLoaderPlugin = require('vue-loader/lib/plugin')

environment.loaders.append('vue', {
  test: /\.vue$/,
  loader: 'vue-loader'
})

environment.plugins.append('vue', new VueLoaderPlugin())

module.exports = environment
