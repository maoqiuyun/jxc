class StoragesController < ApplicationController

  def index
    @search = Storage.search params[:search]
    @storages = @search.order("id desc").paginate :page => params[:page], :per_page => 10
  end

  def show
    @storage = Storage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @storage }
    end
  end

  def new
    @storage = Storage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @storage }
    end
  end

  def edit
    @storage = Storage.find(params[:id])
  end

  def create
    @storage = Storage.new(params[:storage])
    if @storage.save
      flash[:notice] = "添加成功"
      redirect_to storages_url
    else
      flash[:error] = "添加失败"
      render :action => :new
    end
  end

  def update
    @storage = Storage.find(params[:id])

    respond_to do |format|
      if @storage.update_attributes(params[:storage])
        format.html { redirect_to(@storage, :notice => 'Storage was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @storage.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @storage = Storage.find(params[:id])
    @storage.destroy
    flash[:notice] = "删除成功"
    redirect_to storages_url
  end
  
end
