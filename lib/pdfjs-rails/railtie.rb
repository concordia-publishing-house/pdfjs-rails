module Pdfjs
  module Rails
    class Railtie < ::Rails::Railtie
      initializer "pdfjs.view_helpers" do
        ActionView::Base.send :include, Pdfjs::Rails::ViewHelpers
      end
    end
  end
end