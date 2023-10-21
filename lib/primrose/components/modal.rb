require_relative '../prim'

module Primrose
  module Components
    class Modal < Rose
      TEMPLATE = <<~ERB
        <% if @is_open %>
          <label for="modal-<%= @name %>"><%= @label %></label>
          <div class="modal <%= @style_class %>">
            <div class="modal-content">
              <%= @content %>
            </div>
          </div>
        <% end %>
      ERB

      def initialize(content:, is_open: false, name: nil, label: nil, style_class: nil)
        @content = content
        @is_open = is_open
        @name = name
        @label = label
        @style_class = style_class
        super()
      end

      def render
        Prim.render(TEMPLATE, self)
      end

      def open
        @is_open = true
      end

      def close
        @is_open = false
      end
    end
  end
end
