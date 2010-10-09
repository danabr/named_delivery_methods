# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{named_delivery_methods}
  s.version = "0.9.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel Abrahamsson"]
  s.date = %q{2010-10-09}
  s.description = %q{Makes it possible to use different delivery method configurations for different ActionMailer emails and mailers.}
  s.email = %q{daniel.abrahamsson@qnode.se}
  s.extra_rdoc_files = [
    "CHANGELOG",
     "README.rdoc"
  ]
  s.files = [
    "lib/named_delivery_methods.rb",
     "lib/named_delivery_methods/action_mailer_extensions.rb",
     "lib/named_delivery_methods/dummy_delivery_method.rb",
     "lib/named_delivery_methods/exceptions.rb",
     "lib/named_delivery_methods/named_delivery_method.rb",
     "lib/named_delivery_methods/railtie.rb",
     "test/action_mailer_extensions_test.rb",
     "test/dummy_delivery_method_test.rb",
     "test/named_delivery_method_test.rb",
     "test/railtie_test.rb",
     "test/test_delivery_method.rb"
  ]
  s.homepage = %q{http://github.com/danabr/named_delivery_methods}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Use different delivery method configurations for different ActionMailer emails.}
  s.test_files = [
    "test/action_mailer_extensions_test.rb",
     "test/dummy_delivery_method_test.rb",
     "test/named_delivery_method_test.rb",
     "test/railtie_test.rb",
     "test/test_delivery_method.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

