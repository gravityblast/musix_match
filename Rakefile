require 'rubygems'
require 'json'
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new

task :default => :spec

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "musix_match"
    gemspec.summary = "API wrapper for musixmatch.com API's"
    gemspec.description = "API wrapper for musixmatch.com API's"
    gemspec.email = "andrea@gravityblast.com"
    gemspec.homepage = "http://github.com/pilu/musix_match"
    gemspec.authors = ["Andrea Franz"]
    gemspec.files = FileList['LICENSE', 'README.rdoc', 'Rakefile', 'lib/**/*.rb', 'spec/**/*.rb']
    gemspec.add_dependency('json')
    gemspec.add_dependency('httparty', '>= 0.6.1')
    gemspec.extra_rdoc_files = ['README.rdoc', 'LICENSE']
    gemspec.rdoc_options = ['--main=README.rdoc', '--charset=UTF-8']
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end