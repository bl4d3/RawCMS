class ContainersController < ApplicationController
  before_filter :authenticate_admin!, :except => [:index, :show]
  layout 'admin'
  # GET /containers
  # GET /containers.json
  def index
    @containers = Container.all

    unless admin_signed_in?
      @container = Container.where(:place_holder => "home").first
      render :template => "frontend/default", :layout => "frontend/layouts/default"
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render :json => @containers }
      end
    end
  end

  # GET /containers/1
  # GET /containers/1.json
  def show
    if params[:id].blank?
      @container = Container.where(:place_holder => "home").first
    else
      @container = Container.find(params[:id])
    end
    if admin_signed_in?
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @container }
      end
    else
      if params[:id].blank?
        render :template => "frontend/default", :layout => "frontend/layouts/default"
      else
        render :template => "pages/default", :layout => "layouts/application"
      end
    end
  end

  # GET /containers/new
  # GET /containers/new.json
  def new
    @container = Container.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @container }
    end
  end

  # GET /containers/1/edit
  def edit
    @container = Container.find(params[:id])
  end

  # POST /containers
  # POST /containers.json
  def create
    @container = Container.new(params[:container])

    respond_to do |format|
      if @container.save
        format.html { redirect_to @container, :notice => 'Container was successfully created.' }
        format.json { render :json => @container, :status => :created, :location => @container }
      else
        format.html { render :action => "new" }
        format.json { render :json => @container.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /containers/1
  # PUT /containers/1.json
  def update
    @container = Container.find(params[:id])

    respond_to do |format|
      if @container.update_attributes(params[:container])
        format.html { redirect_to @container, :notice => 'Container was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @container.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /containers/1
  # DELETE /containers/1.json
  def destroy
    @container = Container.find(params[:id])
    @container.destroy

    respond_to do |format|
      format.html { redirect_to containers_url }
      format.json { head :ok }
    end
  end
  
  def order	
  	params[:sIds].split(",").each_with_index do |id,index|
  		Container.find(id.split("_")[1]).update_attribute(:order_show, index)
  	end
  end
  
end
