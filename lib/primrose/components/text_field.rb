require_relative '../prim'

module Primrose
  module Components
    class TextField < Rose
      def initialize(placeholder:, name: nil, label: nil, min_length: nil, max_length: nil, read_only: false, default_value: nil, style_class: nil)
        @placeholder = placeholder
        @name = name
        @label = label
        @min_length = min_length
        @max_length = max_length
        @read_only = read_only
        @default_value = default_value
        @style_class = style_class
        super()
      end

      def render
        Prim.render('templates/components/text_field.prim.erb', self)
      end
    end
  end
end
