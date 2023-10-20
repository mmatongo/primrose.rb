require_relative 'lib/primrose/version'

Gem::Specification.new do |s|
  s.name        = 'primrose'
  s.version     = Primrose::VERSION
  s.date        = '2023-10-18'
  s.summary     = "A gem for observable data structures and components"
  s.description = "Build reactive web applications with observable data structures and components"
  s.authors     = ["Daniel M. Matongo"]
  s.email       = 'mmatongo_@hotmail.com'
  s.files       = Dir['lib/**/*.rb', 'templates/**/*e.rb', 'LICENSE', 'README.md']
  s.homepage    = 'https://github.com/mmatongo/primrose.rb'
  s.license     = 'MIT'
  s.add_dependency 'erb', '~> 4.0'
end
