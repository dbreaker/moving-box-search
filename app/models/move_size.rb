class MoveSize < ActiveRecord::Base
  has_one :search
  has_many :box_choices
  has_many :moving_box_kits, :through => :box_choices, :order => 'price'

end
