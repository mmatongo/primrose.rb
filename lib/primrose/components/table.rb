module Primrose
  module Components
    class Table < Rose
      TEMPLATE = <<~ERB
        <table>
          <thead>
            <tr>
              <% @headers.each do |header| %>
                <th><%= header %></th>
              <% end %>
            </tr>
          </thead>
          <tbody>
            <% @rows.each do |row| %>
              <tr>
                <% row.each do |cell| %>
                  <td><%= cell %></td>
                <% end %>
              </tr>
            <% end %>
          </tbody>
        </table>
      ERB

      def initialize(headers, rows)
        @headers = headers
        @rows = rows
      end

      def render
        Prim.render(TEMPLATE, self)
      end
    end
  end
end
