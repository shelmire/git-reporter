lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git-reporter.rb'

Gem::Specification.new do |s|
  s.name = 'git-reporter'
  s.version = GitReporter::VERSION::STRING
  s.platform = Gem::Platform::RUBY
  s.authors = [ 'Alex Shelmire' ]
  s.email = [ 'shelmire at gmail.com' ]
  s.homepage = 'http://www.alexshelmire.com/'
  s.summary = 'Little reporting script'
  s.description = 'Little thing for reporting commits over time for a repo'

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_development_dependency "bundler", "~> 1.3"
  s.add_development_dependency "rake"
  s.add_development_dependency "bundler_geminabox"
end