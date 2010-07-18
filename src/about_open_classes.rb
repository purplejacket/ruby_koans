require File.expand_path(File.join(File.dirname(__FILE__), 'edgecase'))

class AboutOpenClasses < EdgeCase::Koan
  class Dog
    def bark
      "WOOF"
    end
  end

  def test_as_defined_dogs_do_bark
    fido = Dog.new
    assert_equal __("WOOF"), fido.bark
  end

  # ------------------------------------------------------------------

  # Open the existing Dog class and add a new method.
  class Dog
    def wag
      "HAPPY"
    end
  end

  def test_after_reopening_dogs_can_both_wag_and_bark
    fido = Dog.new
    assert_equal __("HAPPY"), fido.wag
    assert_equal __("WOOF"), fido.bark
  end

  # ------------------------------------------------------------------

  class ::Integer
    def even?
      (self % 2) == 0
    end
  end

  def test_even_existing_built_in_classes_can_be_reopened
    assert_equal __(false), 1.even?
    assert_equal __(true), 2.even?
  end

  # NOTE: To understand why we need the :: before Integer, you need to
  # become enlightened about scope.  
end
