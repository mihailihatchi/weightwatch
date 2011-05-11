require 'test_helper'

class CalorieIntakeTest < ActiveSupport::TestCase
  ONE_MONTH=24*60*60*30
  # Replace this with your real tests.
  def test_find_for_user
    user_id=1
    @cals=CalorieIntake.find_for_user(user_id)
    assert_not_nil  @cals
    assert_equal @cals.size, 2
  end
  def test_find_for_user_for_interval
    user_id=1;
    start_date=Time.now
      start_date=start_date-ONE_MONTH
      end_date =Time.now
      @calories = CalorieIntake.find_for_user_for_interval user_id,start_date,end_date
      assert_equal @calories.size, 1
  end
end
