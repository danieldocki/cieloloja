# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'
require "rspec/core/rake_task"
RSpec::Core::RakeTask.new

require 'jeweler'
require './lib/cieloloja/version.rb'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "cieloloja"
  gem.homepage = "http://github.com/giubueno/cieloloja"
  gem.license = "MIT"
  gem.summary = %Q{Integração com a cielo Buy Page Loja}
  gem.description = %Q{Integração com a cielo}
  gem.email = "giulliano@e-processamento.com"
  gem.authors = ["TByte Consultoria", "Giulliano Bueno"]
  gem.version = Cieloloja::Version::STRING
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "cieloloja #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
