class SitemapController < ApplicationController

  def index
    @move_sizes = MoveSize.all
    respond_to do |format| 
      format.xml
    end
  end

end
