require 'rake'
require 'rake/testtask'

begin
  require 'jeweler' 
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "named_delivery_methods"
    gemspec.summary = "Use different delivery method configurations for different ActionMailer emails."
    gemspec.description = "Makes it possible to use different delivery method configurations for different ActionMailer emails and mailers."
    gemspec.email = "daniel.abrahamsson@qnode.se"
    gemspec.homepage = "http://github.com/danabr/named_delivery_methods"
    gemspec.authors = ["Daniel Abrahamsson"]
    gemspec.files = Dir["{lib}/**/*", "{test}/**/*"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end

# Run the unit tests
Rake::TestTask.new { |t|
  t.libs << "test"
  t.pattern = 'test/**/*_test.rb'
  t.warning = true
}


