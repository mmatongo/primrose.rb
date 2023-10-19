require_relative '../prim'

module Primrose
  module Components
    class Checkbox < Rose
      def initialize(label:, checked: false, id: nil, name: nil)
        @label = label
        @checked = checked
        @id = id || label.downcase.gsub(/\s+/, "_")  # Use label as id if id is not provided
        @name = name || @id  # Use id as name if name is not provided
        super()
      end

      def render
        Prim.render('templates/partials/_checkbox.prim.erb', self)
      end

      def set_checked(value)
        @state.alter({ checked: value })
      end
    end
  end
end
