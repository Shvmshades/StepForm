class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
 
  def after_sign_in_path_for(current_user)
    if !@user.name.blank?
      registration_steps_path(@user,:id=> :second)
    else
      registration_steps_path(@user)
    end
  end

  def login?
    if current_user.nil?
      redirect_to new_user_session_path
    end
  end

end
