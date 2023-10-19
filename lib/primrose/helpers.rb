require_relative 'components/button'
require_relative 'components/navbar'
require_relative 'components/text_field'

module Primrose
  module Helpers
    # Load a component dynamically based on the name
    def component(name, **args, &block)
      klass = Object.const_get("Primrose::Components::#{name}")
      begin
        instance = klass.new(**args)
      rescue ArgumentError => e
        puts "Error while initializing #{klass}: #{e.message}"
        puts "Backtrace: #{e.backtrace.join("\n")}"
        raise e
      end
      block&.call(instance)
      instance.render
    end

    # Specific helpers
    def button(label:, action:, **opts)
      component('Button', label: label, action: action, **opts)
    end

    def navbar(links:, **opts)
      component('Navbar', links: links, **opts)
    end

    def text_field(placeholder:, **opts)
      component('TextField', placeholder: placeholder, **opts)
    end
  end
end
