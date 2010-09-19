require 'rubygems'
require 'json'
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
end

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
    gemspec.files = FileList['lib/**/*', 'spec/**/*']
    gemspec.add_dependency('json')
    gemspec.add_dependency('httparty', '>= 0.6.1')
  end
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end