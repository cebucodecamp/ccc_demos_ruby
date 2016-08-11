module Exercism
  class HelloWorld
    def hello(who = nil)
      if who.nil?
        'Hello, World!'
      else
        'Hello, %s!' % who
      end
    end
  end
end
