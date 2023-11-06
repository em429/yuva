class SessionsController < ApplicationController
  skip_before_action :logged_in_user, only: [:new, :create]

  def new
  end

  def create
    passcode = Passcode.first
    if passcode && passcode.authenticate(params[:password])
      session[:passcode_id] = passcode.id
      redirect_to dashboard_path
    else
      flash.now[:danger] = 'Invalid passcode'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.delete(:passcode_id)
    redirect_to root_url
  end

end
