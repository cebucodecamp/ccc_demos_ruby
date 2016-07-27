require File.expand_path('../config/boboot', __FILE__)

require 'minitest'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << %w(test lib)
  t.pattern = 'test/**/*_test.rb'
end

task :default => :test
