class AddUserIdToUccb < ActiveRecord::Migration
  def self.up
    UsedCardBoardBoxProduct.all.each do |prd|
      prd.link = prd.link.gsub("YOURUSERID","508424")
      prd.save!
    end
  end

  def self.down
  end
end
