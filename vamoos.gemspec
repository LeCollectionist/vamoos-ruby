# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'vamoos/version'

Gem::Specification.new do |s|
  s.name          = 'vamoos'
  s.version       = Vamoos::VERSION
  s.authors       = ['Le Collectionist']
  s.email         = ['developers@lecollectionist.com']

  s.summary       = 'A Ruby wrapper for the Vamoos api: http://www.vamoos.com/ API'
  s.homepage      = 'https://github.com/lecollectionist/vamoos-ruby'
  s.license       = 'MIT'
  s.required_ruby_version = '>= 2.7'

  s.metadata = {
    'homepage_uri' => s.homepage,
    'source_code_uri' => 'https://github.com/lecollectionist/vamoos-ruby',
    'changelog_uri' => 'https://github.com/LeCollectionist/vamoos-ruby/blob/master/CHANGELOG.md',
    'bug_tracker_uri' => 'https://github.com/lecollectionist/vamoos-ruby'
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  s.files = ['.rspec', 'Gemfile', 'LICENSE.txt', 'README.md', 'Rakefile', 'vamoos.gemspec']
  s.files += Dir['lib/**/*.rb']
  s.files += Dir['spec/**/*.rb']
  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency('httparty', '~> 0.18.0')
  s.add_development_dependency 'bundler', '>= 2.0', '< 3.0'
  s.add_development_dependency 'rake', '~> 12.0'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rubocop', '~> 0.80'
  s.add_development_dependency 'rubocop-rspec', '~> 1.38'
  s.add_development_dependency 'rubocop-rspec-focused', '~> 1'
end
