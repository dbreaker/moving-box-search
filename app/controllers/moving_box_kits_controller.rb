class MovingBoxKitsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :authenticate_admin, :except => [:login_as_admin]
  
  layout "admin"

  # GET /moving_box_kits
  # GET /moving_box_kits.xml
  def index
    @company = Company.find(params[:company_id]) if params[:company_id]
    if @company 
      @moving_box_kits = @company.moving_box_kits.order("price DESC")
    else
      @moving_box_kits = MovingBoxKit.order("company_id, price DESC")
    end
    @companies = Company.order(:name)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @moving_box_kits }
    end
  end

  # GET /moving_box_kits/1
  # GET /moving_box_kits/1.xml
  def show
    @moving_box_kit = MovingBoxKit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @moving_box_kit }
    end
  end

  # GET /moving_box_kits/new
  # GET /moving_box_kits/new.xml
  def new
    @moving_box_kit = MovingBoxKit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @moving_box_kit }
    end
  end

  # GET /moving_box_kits/1/edit
  def edit
    @moving_box_kit = MovingBoxKit.find(params[:id])
  end

  # POST /moving_box_kits
  # POST /moving_box_kits.xml
  def create
    @moving_box_kit = MovingBoxKit.new(params[:moving_box_kit])

    respond_to do |format|
      if @moving_box_kit.save
        format.html { redirect_to(@moving_box_kit, :notice => 'Moving box kit was successfully created.') }
        format.xml  { render :xml => @moving_box_kit, :status => :created, :location => @moving_box_kit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @moving_box_kit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /moving_box_kits/1
  # PUT /moving_box_kits/1.xml
  def update
    @moving_box_kit = MovingBoxKit.find(params[:id])

    respond_to do |format|
      if @moving_box_kit.update_attributes(params[:moving_box_kit])
        format.html { redirect_to(@moving_box_kit, :notice => 'Moving box kit was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @moving_box_kit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /moving_box_kits/1
  # DELETE /moving_box_kits/1.xml
  def destroy
    @moving_box_kit = MovingBoxKit.find(params[:id])
    @moving_box_kit.destroy

    respond_to do |format|
      format.html { redirect_to(moving_box_kits_url) }
      format.xml  { head :ok }
    end
  end
end
