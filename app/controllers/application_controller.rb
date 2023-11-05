class ApplicationController < ActionController::Base

before_action :logged_in_user

private

def logged_in_user
  unless session[:passcode_id]
    flash[:danger] = "Please log in."
    redirect_to login_url
  end
end

end
