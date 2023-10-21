module Primrose
  module Components
    class HiddenField < Rose
      TEMPLATE = <<~ERB
        <input type="hidden" name="<%= @name %>" value="<%= @value %>">
      ERB

      attr_reader :name, :value

      def initialize(name:, value:)
        @name = name
        @value = value
      end

      def render
        Prim.render(TEMPLATE, self)
      end
    end
  end
end
