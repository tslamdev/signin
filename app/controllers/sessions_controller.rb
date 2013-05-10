class SessionsController < ApplicationController
  def new
  end

  def create
    u = User.find_by_email(params[:email])

    if u.present? && u.authenticate(params[:password])
      session[:user_id] = u.id
      redirect_to users_url, notice: 'Sign in successful.'
    else
      redirect_to new_session_url, notice: 'Nice try.'
    end
  end

  def destroy
  end
end
