require 'thor'

class Hello < Thor
  include Thor::Actions

  desc 'world', 'Say hello world'
  def world
    puts 'Hello world'
  end
end
