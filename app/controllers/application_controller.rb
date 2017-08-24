class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
rescue_from CanCan::AccessDenied do |exception|
  redirect_to main_app.new_user_session_path, alert: exception.message
end

def after_sign_out_path_for(user)
    blogs_path
end

  def after_sign_up_path_for(user)
      blogs_path
  end
end
