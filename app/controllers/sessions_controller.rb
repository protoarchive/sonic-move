class SessionsController < ApplicationController
  def new
    # console
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/', notice: "Login successful."
    else
      flash.now.alert = "Email or password incorrect."
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
