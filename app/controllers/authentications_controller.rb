class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications.all if current_user
  end

  def create
    auth = request.env["omniauth.auth"]
    current_user.authentications.create(:provider => auth['provider'],
                                        :uid => auth['uid'])
    flash[:notice] = "Auth Success"
    redirect_to "/authentications"
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to "/authentications"
  end
end
