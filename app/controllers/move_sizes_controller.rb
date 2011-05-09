class MoveSizesController < ApplicationController

  before_filter :authenticate_user!
  before_filter :authenticate_admin, :except => [:login_as_admin]
  
  layout "admin"

  # GET /move_sizes
  # GET /move_sizes.xml
  def index
    @move_sizes = MoveSize.order("pounds")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @move_sizes }
    end
  end

  # GET /move_sizes/1
  # GET /move_sizes/1.xml
  def show
    @move_size = MoveSize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @move_size }
    end
  end

  # GET /move_sizes/new
  # GET /move_sizes/new.xml
  def new
    @move_size = MoveSize.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @move_size }
    end
  end

  # GET /move_sizes/1/edit
  def edit
    @move_size = MoveSize.find(params[:id])
    @moving_box_kits = MovingBoxKit.order('company_id, price DESC')
    @selected_move_box_kit_ids = []
    @move_size.moving_box_kits.each do |kit|
      @selected_move_box_kit_ids << kit.id
    end
  end

  # POST /move_sizes
  # POST /move_sizes.xml
  def create
    @move_size = MoveSize.new(params[:move_size])

    respond_to do |format|
      if @move_size.save
        format.html { redirect_to(@move_size, :notice => 'Move size was successfully created.') }
        format.xml  { render :xml => @move_size, :status => :created, :location => @move_size }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @move_size.errors, :status => :unprocessable_entity }
      end
    end
  end


  # PUT /move_sizes/1
  # PUT /move_sizes/1.xml
  def update
    @move_size = MoveSize.find(params[:id])

    moving_box_kits = params[:moving_box_kit]
    moving_box_kit_ids = []
    moving_box_kits.each {|k,v| moving_box_kit_ids << k.to_i} if moving_box_kits

    respond_to do |format|
      if @move_size.update_attributes(params[:move_size])

        @move_size.moving_box_kits.delete_all
        @move_size.moving_box_kits << MovingBoxKit.find(moving_box_kit_ids)

        format.html { redirect_to(@move_size, :notice => 'Move size was successfully updated.') }
        format.xml  { head :ok }
      else
        @used_card_board_box_products = UsedCardBoardBoxProduct.find(:all, :order => 'pounds')
        format.html { render :action => "edit" }
        format.xml  { render :xml => @move_size.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /move_sizes/1
  # DELETE /move_sizes/1.xml
  def destroy
    @move_size = MoveSize.find(params[:id])
    @move_size.destroy

    respond_to do |format|
      format.html { redirect_to(move_sizes_url) }
      format.xml  { head :ok }
    end
  end
end
