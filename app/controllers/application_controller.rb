class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Pundit
  def after_sign_in_path_for(resource)
  	user_path(current_user)
  end

  rescue_from Pundit::NotAuthorizedError do |exception|
     redirect_to user_path(current_user), alert: "You are already logged in!"
  end
end