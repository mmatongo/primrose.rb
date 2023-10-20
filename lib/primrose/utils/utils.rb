require_relative '../configuration'

module Primrose
  module Utils
    def self.deep_clone(object)
      Marshal.load(Marshal.dump(object))
    end

    def self.config
      @configuration ||= Primrose::Configuration.new
    end

    def self.configure
      yield(config) if block_given?
    end
  end
end
