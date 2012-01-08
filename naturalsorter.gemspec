# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "naturalsorter/version"

Gem::Specification.new do |s|
  s.name        = "naturalsorter"
  s.version     = Naturalsorter::VERSION
  s.authors     = ["reiz"]
  s.email       = ["robert.reiz@gmx.com"]
  s.homepage    = "http://robert-reiz.com"
  s.summary     = %q{Sorting arrays in natural order}
  s.description = %q{This GEM is sorting Arrays in a natural order. a2 < a10}

  s.rubyforge_project = "naturalsorter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_development_dependency "rspec", "~> 2.6"
end