class UsedCardBoardBoxProductsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :authenticate_admin, :except => [:login_as_admin]
  
  layout "admin"

  # GET /used_card_board_box_products
  # GET /used_card_board_box_products.xml
  def index
    @used_card_board_box_products = UsedCardBoardBoxProduct.order("price DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @used_card_board_box_products }
    end
  end

  # GET /used_card_board_box_products/1
  # GET /used_card_board_box_products/1.xml
  def show
    @used_card_board_box_product = UsedCardBoardBoxProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @used_card_board_box_product }
    end
  end

  # GET /used_card_board_box_products/new
  # GET /used_card_board_box_products/new.xml
  def new
    @used_card_board_box_product = UsedCardBoardBoxProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @used_card_board_box_product }
    end
  end

  # GET /used_card_board_box_products/1/edit
  def edit
    @used_card_board_box_product = UsedCardBoardBoxProduct.find(params[:id])
  end

  # POST /used_card_board_box_products
  # POST /used_card_board_box_products.xml
  def create
    @used_card_board_box_product = UsedCardBoardBoxProduct.new(params[:used_card_board_box_product])

    respond_to do |format|
      if @used_card_board_box_product.save
        format.html { redirect_to(@used_card_board_box_product, :notice => 'Used card board box product was successfully created.') }
        format.xml  { render :xml => @used_card_board_box_product, :status => :created, :location => @used_card_board_box_product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @used_card_board_box_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /used_card_board_box_products/1
  # PUT /used_card_board_box_products/1.xml
  def update
    @used_card_board_box_product = UsedCardBoardBoxProduct.find(params[:id])

    respond_to do |format|
      if @used_card_board_box_product.update_attributes(params[:used_card_board_box_product])
        format.html { redirect_to(@used_card_board_box_product, :notice => 'Used card board box product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @used_card_board_box_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /used_card_board_box_products/1
  # DELETE /used_card_board_box_products/1.xml
  def destroy
    @used_card_board_box_product = UsedCardBoardBoxProduct.find(params[:id])
    @used_card_board_box_product.destroy

    respond_to do |format|
      format.html { redirect_to(used_card_board_box_products_url) }
      format.xml  { head :ok }
    end
  end
end
