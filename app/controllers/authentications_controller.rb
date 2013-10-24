class AuthenticationsController < ApplicationController

  def index
    @authentications = current_user.authentications.all if current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    @account = Authentication.where(provider: auth[:provider], uid: auth[:uid]).first

    if @account.present?
      
      #refresh token if they have already logged in
      session[:user_id] = @account.user_id
      redirect_to "/", :notice => "refreshed your twitter account"
    else
      #create an account for them if they haven't

      user = User.new
      user.save

      authy = user.authentications.create!(
        :provider      => auth[:provider],
        :uid           => auth[:uid],
        :username      => auth[:info][:name]
      )
      session[:user_id] = authy.user_id

      redirect_to "/", :notice => "linked your twitter account"
    end
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to "/authentications"
  end

end
