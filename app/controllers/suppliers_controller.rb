class SuppliersController < ApplicationController
  def index
    @search = Supplier.search(params[:search])
    @suppliers = @search.order("id desc").paginate :page => params[:page], :per_page => 2
  end
  
  def show
  end

  def edit
    @supplier = Supplier.find params[:id]
  end
  
  def new
    @supplier = Supplier.new
  end
  
  def create
    supplier = Supplier.new params[:supplier]
    if supplier.save
      flash[:notice] = "添加成功"
      redirect_to suppliers_url
    else
      flash[:error] = "添加失败"
      render :action => :new
    end
  end
  
  def update
    supplier = Supplier.find params[:id]
    if supplier.update_attributes(params[:supplier])
      flash[:notice] = "修改成功"
      redirect_to suppliers_url
    else
      render :action => :edit
    end
  end 
  
  def destroy
    supplier = Supplier.find params[:id]
    supplier.delete
    flash[:notice] = "删除成功"
    redirect_to suppliers_url
  end
  
end
