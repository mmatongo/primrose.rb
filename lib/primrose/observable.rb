require_relative 'utils/utils'

module Primrose
  class Observable
    def initialize(value)
      @value = value
      @listeners = []
      @previous_value = deep_clone(value)
      @events = {}
    end

    def follow(&block)
      @listeners << block
      block.call(@value, @previous_value)
    end

    def on(event_name, &block)
      (@events[event_name] ||= []) << block
    end

    def trigger(event_name, *args)
      (@events[event_name] || []).each do |listener|
        listener.call(*args)
      end
    end

    # State Persistence
    def save_state(key)
      File.write("#{key}.json", @value.to_json)
    end

    def load_state(key)
      if File.exist?("#{key}.json")
        @value = JSON.parse(File.read("#{key}.json"))
        notify_observers
      end
    end

    def alter(new_value)
      @previous_value = deep_clone(@value)
      @value = new_value
      notify_observers
    end

    def value
      @value
    end

    private

    def deep_clone(object)
      Primrose::Utils.deep_clone(object)
    end

    def notify_observers
      @listeners.each { |listener| listener.call(@value, @previous_value) }
    end
  end
end
