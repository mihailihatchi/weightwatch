require 'test_helper'

class WeightTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_get_all
    @weights= Weight.all
    assert_not_nil @weights
  end
  def test_find_for_user
    user_id=1

    @weights =Weight.find_for_user user_id 
    assert_equal @weights.length, 3

  end
  def test_find_for_user_with_interval
    user_id=1;
    @weights =Weight.find_for_user_for_interval user_id,Time.local(2010,01,01),Time.new;
    
    assert_equal @weights.length, 1
  end
  def test_compare
    @weight1 = Weight.new
    @weight1.weight=100
    @weight2 = Weight.new
    @weight2.weight=120
    assert_equal @weight1<=>@weight2 , -1
  end
end