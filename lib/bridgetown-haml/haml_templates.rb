# frozen_string_literal: true

require "tilt/haml"

module Bridgetown
  class HamlView < RubyTemplateView
    def partial(partial_name, options = {})
      options.merge!(options[:locals]) if options[:locals]

      partial_segments = partial_name.split("/")
      partial_segments.last.sub!(%r!^!, "_")
      partial_name = partial_segments.join("/")

      Tilt::HamlTemplate.new(
        site.in_source_dir(site.config[:partials_dir], "#{partial_name}.haml")
      ).render(self, options)
    end
  end

  module Converters
    class HamlTemplates < Converter
      input :haml

      # Logic to do the Haml content conversion.
      #
      # @param content [String] Content of the file (without front matter).
      # @params convertible [Bridgetown::Page, Bridgetown::Document, Bridgetown::Layout]
      #   The instantiated object which is processing the file.
      #
      # @return [String] The converted content.
      def convert(content, convertible)
        haml_view = Bridgetown::HamlView.new(convertible)

        haml_renderer = Tilt::HamlTemplate.new(convertible.relative_path) { content }

        if convertible.is_a?(Bridgetown::Layout)
          haml_renderer.render(haml_view) do
            convertible.current_document_output
          end
        else
          haml_renderer.render(haml_view)
        end
      end
    end
  end
end
