module Primrose
  module Components
    class GridLayout < Rose
      TEMPLATE = <<~ERB
        <div class="grid-layout <%= @style_class %>">
          <% @rows.each do |row| %>
            <div class="row">
              <% row.each do |column| %>
                <div class="column">
                  <%= column.render %>
                </div>
              <% end %>
            </div>
          <% end %>
        </div>
      ERB

      def initialize(rows, columns, style_class: nil)
        @style_class = style_class
        @rows = rows
        @columns = columns
      end

      def render
        Prim.render(TEMPLATE, self)
      end
    end
  end
end
