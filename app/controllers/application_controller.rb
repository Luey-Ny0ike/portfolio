class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(user)
      blogs_path
  end

  def after_sign_out_path_for(user)
      blogs_path
  end

  def after_sign_up_path_for(user)
      blogs_path
  end
end
