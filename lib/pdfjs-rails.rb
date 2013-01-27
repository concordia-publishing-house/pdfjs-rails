require "pdfjs-rails/version"
require 'pdfjs-rails/view_helpers'
if defined?(::Rails)
  require 'pdfjs-rails/railtie' 
  require 'pdfjs-rails/engine'
end