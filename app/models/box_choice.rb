class BoxChoice < ActiveRecord::Base
  
  belongs_to :move_size
  belongs_to :moving_box_kit

end
