class Api::V1::AuthController < Api::V1::ApplicationController

  def is_signed_in?
    if user_signed_in?
      render :json => current_user.to_json()
    else
      render :json => false
    end
  end
end
