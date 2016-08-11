module Exercism
  module RomanNumerals
    NUMERALS = {
      1 => 'I',
      10 => 'X',
      100 => 'C',
      1000 => 'M'
    }

    MIDWAYS = {
      5 => 'V',
      50 => 'L',
      500 => 'D'
    }

    def to_roman
      in_roman = ''
      numerals = NUMERALS.keys

      cur_num = self
      loop do
        high_n = numerals.detect { |n| cur_num < n }

        if high_n.nil?
          range = [ numerals.last, nil ]
        else
          idx = numerals.index(high_n)
          if idx > 0
            range = [ numerals[idx - 1], high_n ]
          else
            range = [ nil, high_n ]
          end
        end

        if range[0].nil?
          in_roman += NUMERALS[range[1]]

          cur_num = cur_num - range[1]
        elsif range[1].nil?
          ncount = cur_num / range[0]
          in_roman += '%s' % (NUMERALS[range[0]] * ncount)

          cur_num = cur_num - (range[0] * ncount)
        else
          ncount = cur_num / range[0]
          case ncount
          when 1..3
            in_roman += '%s' % (NUMERALS[range[0]] * ncount)
          when 4
            in_roman += '%s%s' % [ NUMERALS[range[0]], MIDWAYS[range[0] * 5] ]
          when 5
            in_roman += '%s' % MIDWAYS[range[0] * 5]
          when 6..8
            in_roman += '%s%s' % [ MIDWAYS[range[0] * 5], NUMERALS[range[0]] * (ncount - 5) ]
          when 9
            in_roman += '%s%s' % [ NUMERALS[range[0]], NUMERALS[range[1]] ]
          end

          cur_num = cur_num - (range[0] * ncount)
        end

        break if cur_num == 0
      end

      in_roman
    end
  end
end
