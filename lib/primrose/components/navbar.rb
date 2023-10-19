require_relative '../prim'

module Primrose
  module Components
    class Navbar < Rose
      def initialize(*args, links:, active_link: nil, sticky: false, brand: nil)
        puts "Non-keyword args: #{args.inspect}"
        puts "Initializing Navbar with #{links.inspect}, #{active_link}, #{sticky}, #{brand}"
        @links = links
        @active_link = active_link
        @sticky = sticky
        @brand = brand
        super()
      end

      def render
        Prim.render('templates/components/navbar.prim.erb', self)
      end

      def set_active_link(new_active_link)
        @state.alter({ active_link: new_active_link })
      end
    end
  end
end
