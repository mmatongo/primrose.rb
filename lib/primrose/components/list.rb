module Primrose
  module Components
    class List < Rose
      TEMPLATE = <<~ERB
        <ul class="<%= @style_class %>">
          <% @items.each do |item| %>
            <li><%= item %></li>
          <% end %>
        </ul>
      ERB

      def initialize(items:, id: nil, style_class: nil)
        @items = items
        @id = id
        @style_class = style_class
        super()
      end

      def render
        Prim.render(TEMPLATE, self)
      end
    end
  end
end
