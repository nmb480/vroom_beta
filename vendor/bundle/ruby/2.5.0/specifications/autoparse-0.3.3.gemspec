# -*- encoding: utf-8 -*-
# stub: autoparse 0.3.3 ruby lib

Gem::Specification.new do |s|
  s.name = "autoparse".freeze
  s.version = "0.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bob Aman".freeze]
  s.date = "2013-03-26"
  s.description = "An implementation of the JSON Schema specification. Provides automatic parsing\nfor any given JSON Schema.\n".freeze
  s.email = "bobaman@google.com".freeze
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "http://autoparse.rubyforge.org/".freeze
  s.rdoc_options = ["--main".freeze, "README.md".freeze]
  s.rubyforge_project = "autoparse".freeze
  s.rubygems_version = "2.7.6".freeze
  s.summary = "A parsing system based on JSON Schema.".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<addressable>.freeze, [">= 2.3.1"])
      s.add_runtime_dependency(%q<multi_json>.freeze, [">= 1.0.0"])
      s.add_runtime_dependency(%q<extlib>.freeze, [">= 0.9.15"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0.9.0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 2.11.0"])
      s.add_development_dependency(%q<launchy>.freeze, [">= 2.1.1"])
    else
      s.add_dependency(%q<addressable>.freeze, [">= 2.3.1"])
      s.add_dependency(%q<multi_json>.freeze, [">= 1.0.0"])
      s.add_dependency(%q<extlib>.freeze, [">= 0.9.15"])
      s.add_dependency(%q<rake>.freeze, [">= 0.9.0"])
      s.add_dependency(%q<rspec>.freeze, [">= 2.11.0"])
      s.add_dependency(%q<launchy>.freeze, [">= 2.1.1"])
    end
  else
    s.add_dependency(%q<addressable>.freeze, [">= 2.3.1"])
    s.add_dependency(%q<multi_json>.freeze, [">= 1.0.0"])
    s.add_dependency(%q<extlib>.freeze, [">= 0.9.15"])
    s.add_dependency(%q<rake>.freeze, [">= 0.9.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 2.11.0"])
    s.add_dependency(%q<launchy>.freeze, [">= 2.1.1"])
  end
end
