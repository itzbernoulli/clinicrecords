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

	# def department
	# 	department.name
 #  	end

	def self.to_csv
    attributes = %w{name age gender address health_care_provider complaints diagnosis treatment height weight temperature blood_pressure 
    	drugs_given front_desk_name nurse_name doctor_name pharmacist_name created_at}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map{ |attr| user.send(attr) }
      end
    end
  end

end
