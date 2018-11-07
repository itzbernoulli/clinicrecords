class Record < ApplicationRecord
	belongs_to :department

	def age
		age = ((Date.today - dob).to_i/365.25).to_i
		if age < 1
			(((Date.today - dob).to_i/30.4167).to_i).to_s + " month(s)"
		else
			age
		end
	end
end
