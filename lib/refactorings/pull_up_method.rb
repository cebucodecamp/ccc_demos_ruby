module Refactorings::PullUpMethod
  module Original
    class Employee
    end

    class Engineer < Employee
      def name
        @name
      end
    end

    class Tester < Employee
      def name
        @name
      end
    end
  end

  module Refactored
    class Employee
      def name
        @name
      end
    end

    class Engineer < Employee
    end

    class Tester < Employee
    end
  end
end
