require File.expand_path('../../../test_helper', __FILE__)
require 'minitest/autorun'
require 'examples'

class BasicsTest < MiniTest::Test
  include Examples

  def setup
    @parent_name = 'Barack'
    @parent_age = 55
    @child_name = 'Malia'
    @child_gender = 'F'
    @mothers_family_name = 'Robinson'

    @parent = Basics::ParentClass.new(@parent_name)
    @child = Basics::ChildClass.new(@child_name, @child_gender)
    @child.mothers_family_name = @mothers_family_name
    @child.weight = 150

    @second_child = @child.dup
    @second_child.instance_eval do
      def say_hi
        'Yehaa'
      end
    end

    @taekwondo = -> do
      'I can do karate!'
    end

    @math = -> do
      'I can add 1 + 1 = %s' % (1 + 1)
    end

    @parent.skills = [ @taekwondo ]
  end

  def test_parent_name
    assert_equal(@parent_name, @parent.name)
  end

  def test_send_for_invoking_functions
    assert_equal(@parent_name, @parent.send(:name))
  end

  def test_child_name
    assert_equal(@child_name, @child.name)
  end

  def test_child_gender
    assert_equal(@child_gender, @child.gender)
  end

  def refute_respond_to_weight
    refute_respond_to(:weight, @child)
  end

  def test_child_has_weight
    assert_equal(150, @child.weight)
  end

  def test_child_has_no_skills
    assert_nil(@child.skills)
  end

  def test_parent_can_do_karate
    assert_equal(@taekwondo.call, @parent.perform_skills)
  end

  def test_parent_can_also_do_math
    # add new skill to parent
    @parent.skills << @math

    assert_equal(@math.call, @parent.perform_skills)
  end

  def test_mother_maiden_name
    assert_equal(@mothers_family_name, @child.mothers_family_name)
  end

  def test_parent_say_hi
    assert_equal('Hi!', @parent.say_hi)
  end

  def test_child_say_howdy
    assert_equal('Howdy!', @child.say_hi)
  end

  def test_second_child_say_yehaa
    assert_equal('Yehaa', @second_child.say_hi)
  end

  def test_parent_class
    assert_equal(Basics::ParentClass, @parent.class)
  end

  def test_child_class
    assert_equal(Basics::ChildClass, @child.class)
  end

  def test_parent_is_superclass
    assert_equal(Basics::ParentClass, @child.class.superclass)
  end

  def test_child_is_mixed
    assert_kind_of(Basics::MixedBreed, @child)
  end

  def test_parent_is_not_mixed
    refute_kind_of(Basics::MixedBreed, @parent)
  end

  def test_parent_age_is_a_number
    assert_kind_of(Numeric, @parent_age)
  end

  def test_parent_age_is_an_object
    [ Fixnum, Integer, Numeric, Object ].each do |klass|
      assert_kind_of(klass, @parent_age)
    end
  end

  def test_class_is_an_object
    assert_kind_of(Object, @parent.class)
  end

  def test_modules_is_module
    assert_kind_of(Module, Examples::Basics)
  end

  def refule_modules_is_not_class
    refute_kind_of(Class, Examples::Basics)
  end
end
