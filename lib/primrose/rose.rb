module Primrose
  class Rose
    attr_reader :state, :event_handlers, :children

    def initialize
      @state = Observable.new({})
      @event_handlers = {}
      @children = []
      lifecycle(:initialize)
    end

    def lifecycle(method)
      send(method) if respond_to?(method)
    end

    def render
      begin
        lifecycle(:before_render)
        lifecycle(:after_render)
      rescue StandardError => e
        handle_error(e)
      end
    end

    def on(event, &block)
      @event_handlers[event] ||= []
      @event_handlers[event] << block
    end

    def trigger(event, *args)
      return unless @event_handlers[event]

      @event_handlers[event].each do |handler|
        handler.call(*args)
      end
    end

    def add_child(child)
      @children << child
    end

    def render_children
      @children.map { |child| child.render }.join("\n")
    end

    # Error Handling
    def handle_error(error)
      puts "An error occurred: #{error.message}"
      error.backtrace.each { |line| puts line }
    end

    def get_binding
      binding
    end
  end
end
