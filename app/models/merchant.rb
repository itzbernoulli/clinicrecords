class Merchant < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many 	 :reviews
  has_many	 :ratings

  def self.same_category(merchant)
  	where(category_id: merchant.category_id)
  end

  def self.all_except(merchant)
  	where.not(id: merchant)
  end


end
