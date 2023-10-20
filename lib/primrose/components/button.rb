require_relative '../prim'

module Primrose
  module Components
    class Button < Rose
      TEMPLATE = <<~ERB
        <button
          onclick="<%= @action %>"
          class="<%= @style %>"
          <%= 'disabled' if @disabled %>
          <%= 'loading' if @loading %>
          >
            <%= @label %>
        </button>
      ERB

      def initialize(label:, action:, style: nil, disabled: false, loading: false)
        @label = label
        @action = action
        @style = style
        @disabled = disabled
        @loading = loading
        super()
      end

      def render
        Prim.render(TEMPLATE, self)
      end

      def set_disabled(value)
        @state.alter({ disabled: value })
      end

      def set_loading(value)
        @state.alter({ loading: value })
      end
    end
  end
end
