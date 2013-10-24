class SessionsController < ApplicationController
  def new
  end

  def create_outside
    s = request.env["omniauth.auth"]
    binding.pry
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Logged in!"
    else
      redirect_to "/login", :notice => "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
