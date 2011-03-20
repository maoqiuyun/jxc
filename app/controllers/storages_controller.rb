class StoragesController < ApplicationController

  def index
    @search = Storage.search params[:search]
    @storages = @search.order("id desc").paginate :page => params[:page], :per_page => 10
  end

  # GET /storages/1
  # GET /storages/1.xml
  def show
    @storage = Storage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @storage }
    end
  end

  # GET /storages/new
  # GET /storages/new.xml
  def new
    @storage = Storage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @storage }
    end
  end

  # GET /storages/1/edit
  def edit
    @storage = Storage.find(params[:id])
  end

  # POST /storages
  # POST /storages.xml
  def create
    @storage = Storage.new(params[:storage])

    respond_to do |format|
      if @storage.save
        format.html { redirect_to(@storage, :notice => 'Storage was successfully created.') }
        format.xml  { render :xml => @storage, :status => :created, :location => @storage }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @storage.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /storages/1
  # PUT /storages/1.xml
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

  # DELETE /storages/1
  # DELETE /storages/1.xml
  def destroy
    @storage = Storage.find(params[:id])
    @storage.destroy

    respond_to do |format|
      format.html { redirect_to(storages_url) }
      format.xml  { head :ok }
    end
  end
  
end
