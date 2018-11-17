# -*- encoding: utf-8 -*-
# stub: mysql2 0.5.1 ruby lib
# stub: ext/mysql2/extconf.rb

Gem::Specification.new do |s|
  s.name = "mysql2"
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.metadata = { "msys2_mingw_dependencies" => "libmariadbclient" } if s.respond_to? :metadata=
  s.require_paths = ["lib"]
  s.authors = ["Brian Lopez", "Aaron Stone"]
  s.date = "2018-04-11"
  s.email = ["seniorlopez@gmail.com", "aaron@serendipity.cx"]
  s.extensions = ["ext/mysql2/extconf.rb"]
  s.files = ["ext/mysql2/extconf.rb"]
  s.homepage = "https://github.com/brianmario/mysql2"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--charset=UTF-8"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0.0")
  s.rubygems_version = "2.5.1"
  s.summary = "A simple, fast Mysql library for Ruby, binding to libmysql"

  s.installed_by_version = "2.5.1" if s.respond_to? :installed_by_version
end
