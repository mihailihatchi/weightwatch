require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  def test_login_ok
    dave = users(:one)
    post :login, :name => dave.username, :password => 'secret'
    assert_redirected_to :controller => "home"
    assert_equal dave.id, session[:user_id]
    assert_equal flash[:notice],nil
  end
  def test_login_admin
    admin = users(:admin)
    post :login, :name => admin.username, :password => 'admin'
    assert_redirected_to :controller => "home"
    assert_equal admin.id, session[:user_id]
    assert_equal admin.role,session[:user_role]
  end
  def test_login_failed
    dave = users(:one)
    post :login, :name => dave.username, :password => 'secretsanta'
    
    assert_equal "Invalid user/password combination", flash[:notice]
 

  end
end
