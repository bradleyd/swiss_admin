require "bundler/gem_tasks"
require 'rake/testtask'
require "minitest/test_task"

#Minitest::TestTask.create # named test, sensible defaults

Minitest::TestTask.create(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.warning = false
  t.test_globs = ["test/test_helper.rb", "test/**/*_test.rb", "test/web/test_*.rb"]
end

#task :default => :test
#Rake::TestTask.new do |t|
#  t.options = "-v"
#  t.libs << "test"
#  t.test_files = FileList["test/*_test.rb", "test/cli/*_test.rb", "test/web/test_*.rb"]
#end

task :default => :test
