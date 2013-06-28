# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rstrip/version"

Gem::Specification.new do |s|
  s.name        = "rstrip"
  s.version     = Rstrip::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["zhengjia"]
  s.email       = ["jiazheng@live.com"]
  s.homepage    = ""
  s.summary     = %q{A ruby executable that removes the trailing white space in the current project directory}
  s.description = %q{A ruby executable that removes the trailing white space in the current project directory. It also remove the last empty line if there is one}

  s.rubyforge_project = "rstrip"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 2.13.0"
  s.add_development_dependency "aruba", "~> 0.5.3"
  s.add_dependency "thor"
end
