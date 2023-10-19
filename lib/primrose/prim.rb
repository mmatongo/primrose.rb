require 'erb'
require 'logger'

module Primrose
  class Prim
    @template_cache = {}
    @logger = Logger.new(STDOUT)

    def self.render(template_path, context)
      template = read_template(template_path)
      erb = ERB.new(template)
      rendered = erb.result(context.get_binding)

      # replace partial tags with actual content
      rendered.gsub(/<%= partial "(.*?)" %>/) do
        partial_path = File.join('templates/partials', "#{$1}.prim.erb")
        render(partial_path, context)
      end
    end

    private

    def self.read_template(template_path)
      @template_cache[template_path] ||= File.read(template_path)
    rescue => e
      @logger.error("Could not read template: #{e.message}")
      raise
    end
  end
end
