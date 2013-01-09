require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')

require "dropbox-api/tasks"
Dropbox::API::Tasks.install

task :default => :spec
