class OauthCallbacksController < ApplicationController
  
  def facebook
    user = User.find_or_create_by_fb(request.env['omniauth.auth'])
    sign_in(user)
    
    redirect_to user
  end
  
end