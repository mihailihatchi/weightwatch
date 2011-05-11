require 'test_helper'
require 'trainings_controller'

class TrainingsControllerTest < ActionController::TestCase
  # Replace this with your real tests.
  def setup
    @training_controller =TrainingsController.new
    session[:user_id]=1
  end
  
  test "index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trainings)
    assert_equal assigns(:trainings).size ,3
  end
  test "new" do
    get :new
    assert_not_nil assigns(:users)    
    
  end
  test "create" do
    assert_difference('Training.count') do
      post :create, :training => {:training_type=>'cardio',:duration=>20,:calories=>100 }
    end
  end
  test "edit get" do
    get :edit, :id => trainings(:one).to_param
    assert_response :success
  end
  test "show " do
    get :show, :id => trainings(:one).to_param
    assert_response :success
  end

  test "delete" do
    assert_difference('Training.count', -1) do
      delete :delete, :id => trainings(:one).to_param
    end
  end
  test "update" do
    put :update, :id => trainings(:one).to_param, :training => {:training_type=>'cardio',:duration=>20,:calories=>100 }
    assert_redirected_to training_path(assigns(:training))
    
  end

end
