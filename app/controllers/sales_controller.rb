class SalesController < ApplicationController
  def index
    @search = Sale.search params[:search]
    @sales = @search.order("id desc").paginate :page => params[:page], :per_page => 10
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = Sale.new
  end

  def destory
    @sale = Sale.find(params[:id])
    @sale.destroy
    flash[:notice] = "删除成功"
    redirect_to sales_url
  end

  def create
    @sale = Sale.new(params[:sale])
    if @sale.save
      @sale.bill_of_products.each do |bill_of_product|
        bill_of_product.product.update_attribute(:number, bill_of_product.product.number.to_i - bill_of_product.number)
      end
      flash[:notice] = "添加成功"
      redirect_to sales_url
    else
      flash[:error] = "添加失败"
      render :action => :new
    end
  end

end
