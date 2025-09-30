# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController

  def passthru
    render plain: "Not implemented, check OmniAuth configuration.", status: :not_found
  end

  def google_auth
    auth_info = request.env['omniauth.auth']
    p auth_info
    user = User.find_or_create_by(email: auth_info['info']['email']) do |u|
      u.name = auth_info['info']['name']
    end

    session[:user_id] = user.id
    redirect_to root_path, notice: "Signed in with Google!"
  end
end
