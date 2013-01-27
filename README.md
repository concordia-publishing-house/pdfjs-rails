# Pdfjs::Rails

Makes [pdf.js](https://github.com/mozilla/pdf.js) available to your Rails 3 application.

## Installation

Add this line to your application's Gemfile:

    gem 'pdfjs-rails'

Add the assets to your application's manifests:

#### application.js
```javascript
// ...
//= require pdfjs-rails
//
```

#### application.css
```css
/* ...
 *= require pdfjs-rails
*/
```

## Example Usage

#### show.html.haml
```haml
%canvas#pdf-canvas= pdf_viewer @document.pdf.url

:javascript
  window.pdf_path = #{@document.pdf.url}
```

NOTE: Addition options for `pdf_viewer` can be discovered in lib/pdfjs-rails/view_helpers.rb

#### show.js.coffee
```coffeescript
$ ->
  # Fetch the PDF document from the URL using promises
  #
  PDFJS.getDocument(window.pdf_path).then (pdf) ->
    
    # Using promise to fetch the page
    pdf.getPage(1).then (page) ->
      scale = 1.5
      viewport = page.getViewport(scale)
      
      #
      # Prepare canvas using PDF page dimensions
      #
      canvas = document.getElementById('pdf-canvas')
      context = canvas.getContext("2d")
      canvas.height = viewport.height
      canvas.width = viewport.width
      
      #
      # Render PDF page into canvas context
      #
      renderContext =
        canvasContext: context
        viewport: viewport

      page.render renderContext
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
