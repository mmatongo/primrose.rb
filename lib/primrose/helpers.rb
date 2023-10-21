require_relative 'components/button'
require_relative 'components/navbar'
require_relative 'components/text_field'
require_relative 'components/checkbox'
require_relative 'components/modal'
require_relative 'components/table'
require_relative 'components/list'
require_relative 'components/grid_layout'
require_relative 'components/hidden_field'
require_relative 'components/form'


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

    def checkbox(label:, checked: false, **opts)
      component('Checkbox', label: label, checked: checked, **opts)
    end

    # def modal(content:, is_open: false, name: nil, label: nil, style_class: nil)
    #   component('Modal', content: content, is_open: is_open, name: name, label: label, style_class: style_class)
    # end

    # def table(headers:, rows:, **opts)
    #   component('Table', headers: headers, rows: rows, **opts)
    # end

    def list(items:, **opts)
      component('List', items: items, **opts)
    end

    # def grid_layout(rows:, columns:, **opts)
    #   component('GridLayout', rows: rows, columns: columns, **opts)
    # end

    def hidden_field(name:, value:, **opts)
      puts "Creating hidden field with name #{name} and value #{value}"
      component('HiddenField', name: name, value: value)
    end

    def form(elements:, method:, style_class: nil, action: nil, **opts, &block)
      component('Form', elements: elements, method: method, style_class: style_class, action: action, **opts, &block)
    end
  end
end
