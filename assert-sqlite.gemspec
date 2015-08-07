# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "assert-sqlite/version"

Gem::Specification.new do |gem|
  gem.name        = "assert-sqlite"
  gem.version     = AssertSqlite::VERSION
  gem.authors     = ["Kelly Redding", "Collin Redding"]
  gem.email       = ["kelly@kellyredding.com", "collin.redding@me.com"]
  gem.description = %q{store tests/results in a sqlite db, not memory}
  gem.summary     = %q{store tests/results in a sqlite db, not memory}
  gem.homepage    = "http://github.com/redding/assert-sqlite"
  gem.license     = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency("assert",  ["~> 2.15"])
  gem.add_dependency("sqlite3", ["~> 1.3"])

end
