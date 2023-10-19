module Primrose
  class Store
    attr_reader :state

    def initialize(initial_state = {})
      @state = Observable.new(initial_state)
    end

    def dispatch(action)
      new_state = @state.value.dup  # Start with a copy of the current state
      puts "Dispatching action: #{action[:type]}"

      action[:updates].each do |key, value|
        puts "Updating #{key} with #{value}"
        new_state[key] = value.call(new_state[key])  # Apply update function to corresponding value in state
        puts "New value: #{new_state[key]}"
      end

      @state.alter(new_state)  # Update state
      puts "New state: #{@state}"
    end
  end
end
