# -*- encoding: utf-8 -*-
# stub: bootsnap 1.3.0 ruby lib
# stub: ext/bootsnap/extconf.rb

Gem::Specification.new do |s|
  s.name = "bootsnap"
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Burke Libbey"]
  s.date = "2018-04-09"
  s.description = "Boot large ruby/rails apps faster"
  s.email = ["burke.libbey@shopify.com"]
  s.extensions = ["ext/bootsnap/extconf.rb"]
  s.files = ["ext/bootsnap/extconf.rb"]
  s.homepage = "https://github.com/Shopify/bootsnap"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.5.1"
  s.summary = "Boot large ruby/rails apps faster"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1"])
      s.add_development_dependency(%q<rake>, ["~> 10.0"])
      s.add_development_dependency(%q<rake-compiler>, ["~> 0"])
      s.add_development_dependency(%q<minitest>, ["~> 5.0"])
      s.add_development_dependency(%q<mocha>, ["~> 1.2"])
      s.add_runtime_dependency(%q<msgpack>, ["~> 1.0"])
    else
      s.add_dependency(%q<bundler>, ["~> 1"])
      s.add_dependency(%q<rake>, ["~> 10.0"])
      s.add_dependency(%q<rake-compiler>, ["~> 0"])
      s.add_dependency(%q<minitest>, ["~> 5.0"])
      s.add_dependency(%q<mocha>, ["~> 1.2"])
      s.add_dependency(%q<msgpack>, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1"])
    s.add_dependency(%q<rake>, ["~> 10.0"])
    s.add_dependency(%q<rake-compiler>, ["~> 0"])
    s.add_dependency(%q<minitest>, ["~> 5.0"])
    s.add_dependency(%q<mocha>, ["~> 1.2"])
    s.add_dependency(%q<msgpack>, ["~> 1.0"])
  end
end
