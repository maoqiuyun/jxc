class ApplicationController < ActionController::Base
  protect_from_forgery
    
  before_filter :login_required

  private
  def login_required
    if session[:user].nil?
      flash[:error] = "请登录"
      redirect_to root_url
    else
       @current_user = Thread.current[:current_user] = session[:user]   
    end
  end
  
end
