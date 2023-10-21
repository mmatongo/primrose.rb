module Primrose
  module Components
    class Form < Rose
      TEMPLATE = <<~ERB
        <form class="<%= @style_class %>" action="<%= @action %>" method="<%= @method %>">
          <%= @elements.join("\n") %>
        </form>
      ERB

      def initialize(elements:, method:, style_class: nil, action: nil, **opts)
        @elements = elements
        @options = opts
        @style_class = style_class
        @action = action
        @method = method
        super()
      end

      def render
        Prim.render(TEMPLATE, self)
      end
    end
  end
end
