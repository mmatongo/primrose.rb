module Primrose
  class Router
    def initialize
      @routes = {}
    end

    def route(path, &block)
      @routes[path] = block
    end

    def navigate(path)
      return unless @routes[path]

      @routes[path].call
    end
  end
end
