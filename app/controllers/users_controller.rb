class UsersController < ApplicationController
  def new
    @user = RegularUser.new
  end

  def create
    @user = RegularUser.new(params[:regular_user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/", :notice => "Signed Up!"
    else
      render "new"
    end
  end
end
