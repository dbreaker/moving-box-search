class BoxChoicesController < ApplicationController
  # GET /box_choices
  # GET /box_choices.xml
  def index
    @box_choices = BoxChoice.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @box_choices }
    end
  end

  # GET /box_choices/1
  # GET /box_choices/1.xml
  def show
    @box_choice = BoxChoice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @box_choice }
    end
  end

  # GET /box_choices/new
  # GET /box_choices/new.xml
  def new
    @box_choice = BoxChoice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @box_choice }
    end
  end

  # GET /box_choices/1/edit
  def edit
    @box_choice = BoxChoice.find(params[:id])
  end

  # POST /box_choices
  # POST /box_choices.xml
  def create
    @box_choice = BoxChoice.new(params[:box_choice])

    respond_to do |format|
      if @box_choice.save
        format.html { redirect_to(@box_choice, :notice => 'Box choice was successfully created.') }
        format.xml  { render :xml => @box_choice, :status => :created, :location => @box_choice }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @box_choice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /box_choices/1
  # PUT /box_choices/1.xml
  def update
    @box_choice = BoxChoice.find(params[:id])

    respond_to do |format|
      if @box_choice.update_attributes(params[:box_choice])
        format.html { redirect_to(@box_choice, :notice => 'Box choice was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @box_choice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /box_choices/1
  # DELETE /box_choices/1.xml
  def destroy
    @box_choice = BoxChoice.find(params[:id])
    @box_choice.destroy

    respond_to do |format|
      format.html { redirect_to(box_choices_url) }
      format.xml  { head :ok }
    end
  end
end
