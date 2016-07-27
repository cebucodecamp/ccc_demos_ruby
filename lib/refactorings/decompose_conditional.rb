require 'time'

module Refactorings::DecomposeConditional
  # start of april
  SUMMER_START = Time.parse('2016-04-01').to_date
  # end of june
  SUMMER_END = Time.parse('2016-07-01').to_date

  WINTER_RATE = 9.99
  WINTER_SERVICE_CHARGE = 2.50
  SUMMER_RATE = 6.99

  module Original
    class CalculateCharge
      def calculate(date, qty)
        if (date < SUMMER_START) || (date > SUMMER_END)
          charge = (qty * WINTER_RATE) + WINTER_SERVICE_CHARGE
        else
          charge = (qty * SUMMER_RATE)
        end
      end
    end
  end

  module Refactored
    class CalculateCharge
      def calculate(date, qty)
        is_winter?(date) ? winter_rate(qty) : summer_rate(qty)
      end

      def is_winter?(date)
        (date < SUMMER_START) || (date > SUMMER_END)
      end

      def winter_rate(qty)
        (qty * WINTER_RATE) + WINTER_SERVICE_CHARGE
      end

      def summer_rate(qty)
        (qty * SUMMER_RATE)
      end
    end
  end
end
