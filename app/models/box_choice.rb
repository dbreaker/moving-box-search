class BoxChoice < ActiveRecord::Base
  
  belongs_to :move_size
  belongs_to :used_card_board_box_product

end
