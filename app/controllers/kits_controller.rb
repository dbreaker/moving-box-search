class KitsController < ApplicationController
  
  def index
    slug = params[:slug] || "large-2-bedroom"
    session[:size_slug] = slug
    @move_size = MoveSize.find_by_slug(slug)
    @meta_title = "#{@move_size.home_size} Moving Box Kits | Moving Boxes for a #{@move_size.home_size} | MovingBoxSearch.com"
    @meta_desc = "#{@move_size.home_size} Moving Box Kits - Compare prices from multiple providers.  Buy online and get your boxes in a couple days.  Free Shipping. MovingBoxSearch.com"
  end

end
