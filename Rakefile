require "bundler/gem_tasks"
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.options = "-v"
  t.libs << "test"
  t.test_files = FileList["test/*_test.rb"]
end
