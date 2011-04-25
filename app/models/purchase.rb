class Purchase < ActiveRecord::Base
  
  belongs_to :user

  validates_uniqueness_of :aff_transaction_id

end
