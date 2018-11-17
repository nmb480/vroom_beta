# -*- encoding: utf-8 -*-
# stub: activeadmin 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "activeadmin"
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Greg Bell"]
  s.date = "2018-04-20"
  s.description = "The administration framework for Ruby on Rails."
  s.email = ["gregdbell@gmail.com"]
  s.homepage = "http://activeadmin.info"
  s.licenses = ["MIT"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.2")
  s.rubygems_version = "2.5.1"
  s.summary = "The administration framework for Ruby on Rails."

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<arbre>, [">= 1.1.1"])
      s.add_runtime_dependency(%q<coffee-rails>, [">= 0"])
      s.add_runtime_dependency(%q<formtastic>, ["~> 3.1"])
      s.add_runtime_dependency(%q<formtastic_i18n>, [">= 0"])
      s.add_runtime_dependency(%q<inherited_resources>, [">= 1.7.0"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 4.2.0"])
      s.add_runtime_dependency(%q<kaminari>, [">= 0.15"])
      s.add_runtime_dependency(%q<railties>, ["< 5.3", ">= 4.2"])
      s.add_runtime_dependency(%q<ransack>, ["~> 1.3"])
      s.add_runtime_dependency(%q<sass>, ["~> 3.1"])
      s.add_runtime_dependency(%q<sprockets>, ["< 4.1"])
    else
      s.add_dependency(%q<arbre>, [">= 1.1.1"])
      s.add_dependency(%q<coffee-rails>, [">= 0"])
      s.add_dependency(%q<formtastic>, ["~> 3.1"])
      s.add_dependency(%q<formtastic_i18n>, [">= 0"])
      s.add_dependency(%q<inherited_resources>, [">= 1.7.0"])
      s.add_dependency(%q<jquery-rails>, [">= 4.2.0"])
      s.add_dependency(%q<kaminari>, [">= 0.15"])
      s.add_dependency(%q<railties>, ["< 5.3", ">= 4.2"])
      s.add_dependency(%q<ransack>, ["~> 1.3"])
      s.add_dependency(%q<sass>, ["~> 3.1"])
      s.add_dependency(%q<sprockets>, ["< 4.1"])
    end
  else
    s.add_dependency(%q<arbre>, [">= 1.1.1"])
    s.add_dependency(%q<coffee-rails>, [">= 0"])
    s.add_dependency(%q<formtastic>, ["~> 3.1"])
    s.add_dependency(%q<formtastic_i18n>, [">= 0"])
    s.add_dependency(%q<inherited_resources>, [">= 1.7.0"])
    s.add_dependency(%q<jquery-rails>, [">= 4.2.0"])
    s.add_dependency(%q<kaminari>, [">= 0.15"])
    s.add_dependency(%q<railties>, ["< 5.3", ">= 4.2"])
    s.add_dependency(%q<ransack>, ["~> 1.3"])
    s.add_dependency(%q<sass>, ["~> 3.1"])
    s.add_dependency(%q<sprockets>, ["< 4.1"])
  end
end
