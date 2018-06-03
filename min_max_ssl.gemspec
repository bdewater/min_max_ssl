
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "min_max_ssl/version"

Gem::Specification.new do |spec|
  spec.name          = "min_max_ssl"
  spec.version       = MinMaxSSL::VERSION
  spec.authors       = ["Bart de Water"]
  spec.email         = ["bartdewater@gmail.com"]

  spec.summary       = %q{Ruby 2.5 Net::HTTP#min_version/max_version backport for Ruby 2.3 and 2.4}
  spec.license       = "Ruby"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = [">= 2.3.0", "< 2.5.0"]

  spec.add_dependency "openssl", "~> 2.1"
  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
