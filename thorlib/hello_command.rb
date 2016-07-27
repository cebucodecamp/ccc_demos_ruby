require 'thor'

class HelloCommand < Thor
  include Thor::Actions

  namespace 'hello'

  desc 'world', 'Say hello world'
  def world
    puts 'Hello world'
  end
end
