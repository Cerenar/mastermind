require_relative 'lib/mastermind/version'

Gem::Specification.new do |spec|
  spec.name          = "mastermind"
  spec.version       = Mastermind::VERSION
  spec.authors       = ["Cameron"]
  spec.email         = ["camerondonner63@gmail.com"]

  spec.summary       = %q{TODO: Write a short summary, because RubyGems requires one.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = ""

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rakefile'
  spec.add_development_dependency 'bundler', '~>1.3'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
