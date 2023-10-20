require_relative '../prim'

module Primrose
  module Components
    class Navbar < Rose
      TEMPLATE = <<~ERB
        <nav class="<%= 'sticky' if @sticky %>">
          <%= @brand if @brand %>
          <ul>
            <% @links.each do |link| %>
              <li class="<%= 'active' if link[:url] == @active_link %>">
                <a href="<%= link[:url] %>"><%= link[:text] %></a>
                <% if link[:dropdown] %>
                  <ul class="dropdown">
                    <% link[:dropdown].each do |dropdown_link| %>
                      <li><a href="<%= dropdown_link[:url] %>"><%= dropdown_link[:text] %></a></li>
                    <% end %>
                  </ul>
                <% end %>
              </li>
            <% end %>
          </ul>
        </nav>
      ERB

      def initialize(*args, links:, active_link: nil, sticky: false, brand: nil)
        @links = links
        @active_link = active_link
        @sticky = sticky
        @brand = brand
        super()
      end

      def render
        Prim.render(TEMPLATE, self)
      end

      def set_active_link(new_active_link)
        @state.alter({ active_link: new_active_link })
      end
    end
  end
end
