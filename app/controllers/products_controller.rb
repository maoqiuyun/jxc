class ProductsController < ApplicationController
  
  before_filter :find_product, :only => [:edit,:destroy,:update,:regain]
  
  def index
    @name,@supplier_name,@brand,@brand_type = params.values_at(:name,:supplier_name,:brand,:brand_type)
    @products = Product.by_name(@name).by_supplier(@supplier_name).by_brand(@brand).by_brand_type(@brand_type).order("id desc").paginate :page => params[:page], :per_page => 10
  end

  def new
    @supplier = Supplier.find_by_id params[:supplier_id]
    @product = Product.new 
  end

  def edit
  end

  def select_suppliers
    @suppliers = Supplier.all.paginate :page => params[:page], :per_page => 2
    render :layout => false
  end
  
  def create
    product = Product.new params[:product]
    if product.save
      flash[:notice] = "添加成功"
      redirect_to products_url
    else
      flash[:error] = "添加失败"
      render :action => :new
    end
  end
  
  def update
    if @product.update_attributes(params[:product])
      flash[:notice] = "修改成功"
      redirect_to products_url
    else
      render :action => :edit
    end
  end
  
  def destroy
    @product.delete
    flash[:notice] = "下架成功"
    redirect_to products_url
  end
  
  #下架的商品
  def disuse
    p "wwwww"
  end
  
  #重新上架
  def regain
    
  end
  
  private 
  def find_product
    @product = Product.find params[:id]
  end

end
