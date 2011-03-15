class UsersController < ApplicationController
  
  def index
    @users = User.order("id desc")
  end

  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def create
    user = User.new params[:user]
    if user.save
      flash[:notice] = "添加成功"
      redirect_to users_url
    else
      flash[:error] = "添加失败"
      render :action => :new
    end
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(params[:user])
      flash[:notice] = "修改成功"
      redirect_to :action => :index
    else
      render :action => :edit
    end
  end
  
  def destroy
    user = User.find(params[:id])
    user.delete
    flash[:notice] = "删除成功"
    redirect_to users_url
  end
end
