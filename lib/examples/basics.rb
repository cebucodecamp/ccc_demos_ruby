module Examples
  module Basics
    class ParentClass
      attr_accessor :skills

      def initialize(name)
        @name = name
      end

      def name
        @name
      end

      def say_hi
        'Hi!'
      end

      def perform_skills
        unless skills.nil?
          skills.last.call
        else
          nil
        end
      end
    end

    module MixedBreed
      def mothers_family_name=(m_fname)
        @m_fname = m_fname
      end

      def mothers_family_name
        @m_fname
      end
    end

    class ChildClass < ParentClass
      include MixedBreed

      attr_reader :gender

      def initialize(name, gender)
        super(name)
        @gender = gender
      end

      def say_hi
        'Howdy!'
      end

      def method_missing(m, *args, &block)
        case m
        when 'weight='.to_sym
          @weight = args[0]
        when :weight
          @weight
        else
          super
        end
      end
    end
  end
end
