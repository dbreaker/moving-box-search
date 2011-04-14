class MoveSize < ActiveRecord::Base
  has_one :search
  has_many :box_choices
  has_many :used_card_board_box_products, :through => :box_choices, :order => 'price'
end
