module Exercism
  class Phrase
    def initialize(sentence)
      @sentence = sentence
    end

    def word_count
      word_counts = { }

      # split by one or more spaces
      parts = @sentence.split(/[\,\s\.]+/)

      # clean-up entries
      parts = parts.inject([ ]) do |a,p|
        if p =~ /^\'([^\']*)\'$/
          p = $~[1]
        end

        if p =~ /^([A-Za-z0-9\']+).*$/
          a << $~[1]
        end

        a
      end

      parts.each do |p|
        p = p.downcase

        if word_counts.include?(p)
          word_counts[p] += 1
        else
          word_counts[p] = 1
        end
      end

      word_counts
    end
  end
end
