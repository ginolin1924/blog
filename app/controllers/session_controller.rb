class SessionController < ApplicationController
  def new
  end
  
  def create
    if user = User.find_by(name: params[:name]).try(:authenticate, params[:password])
    	session[:user_id] = user.id
    	session.delete(:is_guest)
    	redirect_to root_path
    else
    	render :new
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
  
  def as_guest
    session[:is_guest] = 1
    redirect_to root_path
  end
  
  def delete_guest
    session.delete(:is_guest)
    redirect_to root_path
  end
end
