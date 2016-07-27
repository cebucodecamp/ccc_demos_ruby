module Refactorings::ReplaceDelegationWithInheritance
  module Original
    class Employee
      def initialize(name)
        @person = Person.new(name)
      end

      def name
        @person.name
      end
    end

    class Person
      def initialize(name)
        @name = name
      end

      def name
        @name
      end
    end
  end

  module Refactored
    class Person
      def initialize(name)
        @name = name
      end

      def name
        @name
      end
    end

    class Employee < Person
    end
  end
end
