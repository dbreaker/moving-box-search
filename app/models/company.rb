class Company < ActiveRecord::Base
  
  validates_presence_of :name, :url, :merchant_id
  has_many :moving_box_kits

  def make_moving_box_kit_descriptions_pretty
    self.moving_box_kits.each do |kit|
      kit.make_description_pretty
    end
  end
end
