# -*- encoding: utf-8 -*-
# stub: google-api-client 0.8.6 ruby lib

Gem::Specification.new do |s|
  s.name = "google-api-client".freeze
  s.version = "0.8.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.5".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bob Aman".freeze, "Steven Bazyl".freeze]
  s.date = "2015-04-15"
  s.description = "The Google API Ruby Client makes it trivial to discover and access supported APIs.".freeze
  s.email = "sbazyl@google.com".freeze
  s.extra_rdoc_files = ["README.md".freeze]
  s.files = ["README.md".freeze]
  s.homepage = "https://github.com/google/google-api-ruby-client/".freeze
  s.licenses = ["Apache-2.0".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze]
  s.rubygems_version = "2.7.6".freeze
  s.summary = "The Google API Ruby Client makes it trivial to discover and access Google's REST APIs.".freeze

  s.installed_by_version = "2.7.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<addressable>.freeze, ["~> 2.3"])
      s.add_runtime_dependency(%q<signet>.freeze, ["~> 0.6"])
      s.add_runtime_dependency(%q<faraday>.freeze, ["~> 0.9"])
      s.add_runtime_dependency(%q<googleauth>.freeze, ["~> 0.3"])
      s.add_runtime_dependency(%q<multi_json>.freeze, ["~> 1.10"])
      s.add_runtime_dependency(%q<autoparse>.freeze, ["~> 0.3"])
      s.add_runtime_dependency(%q<extlib>.freeze, ["~> 0.9"])
      s.add_runtime_dependency(%q<launchy>.freeze, ["~> 2.4"])
      s.add_runtime_dependency(%q<retriable>.freeze, ["~> 1.4"])
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3.2"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_development_dependency(%q<kramdown>.freeze, ["~> 1.5"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.9.2"])
      s.add_development_dependency(%q<coveralls>.freeze, ["~> 0.7.11"])
    else
      s.add_dependency(%q<addressable>.freeze, ["~> 2.3"])
      s.add_dependency(%q<signet>.freeze, ["~> 0.6"])
      s.add_dependency(%q<faraday>.freeze, ["~> 0.9"])
      s.add_dependency(%q<googleauth>.freeze, ["~> 0.3"])
      s.add_dependency(%q<multi_json>.freeze, ["~> 1.10"])
      s.add_dependency(%q<autoparse>.freeze, ["~> 0.3"])
      s.add_dependency(%q<extlib>.freeze, ["~> 0.9"])
      s.add_dependency(%q<launchy>.freeze, ["~> 2.4"])
      s.add_dependency(%q<retriable>.freeze, ["~> 1.4"])
      s.add_dependency(%q<activesupport>.freeze, [">= 3.2"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
      s.add_dependency(%q<kramdown>.freeze, ["~> 1.5"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.9.2"])
      s.add_dependency(%q<coveralls>.freeze, ["~> 0.7.11"])
    end
  else
    s.add_dependency(%q<addressable>.freeze, ["~> 2.3"])
    s.add_dependency(%q<signet>.freeze, ["~> 0.6"])
    s.add_dependency(%q<faraday>.freeze, ["~> 0.9"])
    s.add_dependency(%q<googleauth>.freeze, ["~> 0.3"])
    s.add_dependency(%q<multi_json>.freeze, ["~> 1.10"])
    s.add_dependency(%q<autoparse>.freeze, ["~> 0.3"])
    s.add_dependency(%q<extlib>.freeze, ["~> 0.9"])
    s.add_dependency(%q<launchy>.freeze, ["~> 2.4"])
    s.add_dependency(%q<retriable>.freeze, ["~> 1.4"])
    s.add_dependency(%q<activesupport>.freeze, [">= 3.2"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.8"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.1"])
    s.add_dependency(%q<kramdown>.freeze, ["~> 1.5"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.9.2"])
    s.add_dependency(%q<coveralls>.freeze, ["~> 0.7.11"])
  end
end
