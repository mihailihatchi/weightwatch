class LoginController < ApplicationController
  before_filter :authorize,:except=>:login
  #This method handles login and
  #configures session for the application
  # we need to put straight objects in the session
  def login
    session[:user_id] = nil
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user!=nil
        session[:user_id] = user.id
        session[:user_role]=user.role
        #clear flash notice
        flash[:notice]=nil
        redirect_to(:controller=>"home" )
      else
        flash[:notice] = "Invalid user/password combination"
      end
    end
  end
  def login_error
  end

end
