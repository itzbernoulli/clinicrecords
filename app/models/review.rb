class Review < ApplicationRecord
  belongs_to :merchant
  belongs_to :user

  validates :content, length: {minimum: 10,message: "%{value} is not a valid size"}
end
