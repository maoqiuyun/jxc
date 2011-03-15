class SessionsController < ApplicationController
  
  skip_before_filter :login_required 
  
  def index
    render :layout =>  false
  end
  
  def verify
    user_name = params[:user_name]
    password = params[:password]
    
    user = User.where(["user_name = ? and password = ?" ,user_name, password]).first
    if user.nil?
      flash[:error] = "用户名或密码错误"
      redirect_to root_url
    else
      session[:user] = user
      redirect_to home_url
    end
  end

  def logout
    p "333333333333333"
    session[:user] = nil
    redirect_to root_url
  end
end
