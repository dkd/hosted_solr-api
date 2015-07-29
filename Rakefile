require 'bundler/gem_tasks'

require 'rubocop/rake_task'
RuboCop::RakeTask.new

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new('spec')
task default: :spec

require 'coveralls/rake/task'
Coveralls::RakeTask.new
task test_with_coveralls: [:rubocop, :spec, 'coveralls:push']
