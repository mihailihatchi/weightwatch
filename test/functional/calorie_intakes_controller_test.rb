require 'test_helper'

class CalorieIntakesControllerTest < ActionController::TestCase
  def setup
    session[:user_id]=1
  end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calorie_intakes)
    
    assert_equal(assigns(:calorie_intakes).size ,1)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calorie_intake" do
    assert_difference('CalorieIntake.count') do
      post :create, :calorie_intake => {:calorie_intake=>'2090' }
    end

    assert_redirected_to calorie_intake_path(assigns(:calorie_intake))
  end

  test "should show calorie_intake" do
    get :show, :id => calorie_intakes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => calorie_intakes(:one).to_param
    assert_response :success
  end

  test "should update calorie_intake" do
    put :update, :id => calorie_intakes(:one).to_param, :calorie_intake => {:calorie_intake=>'100' }
    assert_redirected_to calorie_intake_path(assigns(:calorie_intake))
  end

  test "should destroy calorie_intake" do
    assert_difference('CalorieIntake.count', -1) do
      delete :destroy, :id => calorie_intakes(:one).to_param
    end

    assert_redirected_to calorie_intakes_path
  end
end
