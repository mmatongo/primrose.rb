require_relative '../prim'

module Primrose
  module Components
    class TextField < Rose
      TEMPLATE = <<~ERB
        <% if @label %>
          <label for="textfield"><%= @label %></label>
        <% end %>
        <input type="text"
              name="<%= @name %>"
              placeholder="<%= @placeholder %>"
              <% if @min_length %> minlength="<%= @min_length %>" <% end %>
              <% if @max_length %> maxlength="<%= @max_length %>" <% end %>
              <% if @read_only %> readonly <% end %>
              <% if @default_value %> value="<%= @default_value %>" <% end %>
              <% if @style_class %> class="<%= @style_class %>" <% end %>
        >
      ERB

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
        Prim.render(TEMPLATE, self)
      end
    end
  end
end
