require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

namespace :spec do
  RSpec::Core::RakeTask.new(:warning) do |t|
    t.ruby_opts="-w"
  end
end

require "dropbox-api/tasks"
Dropbox::API::Tasks.install

task :default => :spec
