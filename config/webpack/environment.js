const { environment } = require('@rails/webpacker')

// Bootstrap 3 has a dependency over jQuery:
const webpack = require('webpack')
environment.plugins.append('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
  })
)

module.exports = environment
