class ProductsController < ApplicationController
  
  before_filter :find_product, :only => [:edit]
  
  def index
  end

  def new
    @product = Product.new 
  end

  def edit
  end

  def select_suppliers
    @suppliers = Supplier.all.paginate :page => params[:page], :per_page => 2
    render :layout => false
  end
  
  private 
  def find_product
    @product = Product.find params[:id]
  end

end
