require_relative '../prim'

module Primrose
  module Components
    class Checkbox < Rose
      TEMPLATE = <<~ERB
        <div class="checkbox">
          <input type="checkbox" id="<%= @id %>" name="<%= @name %>" onchange="<%= @js %>" <%= 'checked="checked"' if @checked %> />
          <label for="<%= @id %>"><%= @label %></label>
        </div>
      ERB


      def initialize(label:, checked: false, id: nil, name: nil, js: nil)
        @label = label
        @checked = checked
        @id = id || label.downcase.gsub(/\s+/, "_")  # Use label as id if id is not provided
        @name = name || @id  # Use id as name if name is not provided
        @js = js
        super()
      end

      def render
        Prim.render(TEMPLATE, self)
      end

      def set_checked(value)
        @state.alter({ checked: value })
      end
    end
  end
end
