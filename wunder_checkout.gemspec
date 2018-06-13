
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wunder_checkout/version"

Gem::Specification.new do |spec|
  spec.name          = "wunder_checkout"
  spec.version       = WunderCheckout::VERSION
  spec.authors       = ["Raheem Shaik"]
  spec.email         = ["shaikraheem141@gmail.com"]

  spec.summary       = %q{Implementing checkout system}
  spec.description   = %q{A checkout system where promotions can be applied based on the cart itesms & price.}
  spec.homepage      = "https://github.com/srinu0541/wunder_checkout"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
