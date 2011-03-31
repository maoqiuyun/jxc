class StoragesController < ApplicationController

  def index
    @search = Storage.search params[:search]
    @storages = @search.order("id desc").paginate :page => params[:page], :per_page => 10
  end

  def show
    @storage = Storage.find(params[:id])
  end

  def new
    @storage = Storage.new
  end

  def edit
    @storage = Storage.find(params[:id])
  end

  def create
    @storage = Storage.new(params[:storage])
    if @storage.save
      @storage.bill_of_products.each do |bill_of_product|
        bill_of_product.product.update_attribute(:number, bill_of_product.product.number.to_i + bill_of_product.number)
      end
      flash[:notice] = "添加成功"
      redirect_to storages_url
    else
      flash[:error] = "添加失败"
      render :action => :new
    end
  end

  def destroy
    @storage = Storage.find(params[:id])
    @storage.destroy
    flash[:notice] = "删除成功"
    redirect_to storages_url
  end
  
end
