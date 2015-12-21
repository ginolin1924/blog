class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  helper_method :current_user, :user_signed_in?, :is_guest?, :is_teacher?
  
  protected
  def current_user
  	User.find_by(id: session[:user_id])
  end

  def user_signed_in?
  	!current_user.nil?
  end
  
  def is_guest?
    session[:is_guest]
  end
  
  def is_teacher?
    if (current_user)
      current_user.role == 'admin' || current_user.role == 'teacher'
    end
  end
end
