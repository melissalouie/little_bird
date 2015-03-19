class SessionsController < ApplicationController
  def new
  end

  def create
    uid = env['omniauth.auth']['uid']
    session[:user_id] = uid
    user = User.find_or_create_by(oauth_user_id: uid)
    user.update_attributes(name: env['omniauth.auth']['info']['name'])
    @token = user.update_attributes(token: env['omniauth.auth']['credentials']['token'])
    @secret = user.update_attributes(secret: env['omniauth.auth']['credentials']['secret'])

    redirect_to news_path
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = "You're now logged out"
    redirect_to root_path
  end
end
