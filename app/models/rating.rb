class Rating < ApplicationRecord
  belongs_to :merchant
  belongs_to :user


  def self.total_rating(merchant)
  	total_score = 0.0
  	ratings = where(merchant_id: merchant.id)
  	ratings.length.times do |r|
  		total_score += ratings[r].score
  	end
  	total_score
  end
end
