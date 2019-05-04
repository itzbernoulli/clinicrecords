# == Schema Information
#
# Table name: records
#
#  id                     :uuid             not null, primary key
#  address                :string
#  admin_name             :string
#  admin_update_time      :datetime
#  blood_pressure         :string
#  complaints             :string
#  diagnosis              :string
#  dob                    :date
#  doctor_name            :string
#  doctor_update_time     :datetime
#  doctor_updated         :boolean          default(FALSE)
#  drugs_given            :string
#  front_desk_name        :string
#  gender                 :string
#  health_care_provider   :string
#  height                 :string
#  name                   :string
#  nurse_name             :string
#  nurse_update_time      :datetime
#  nurse_updated          :boolean          default(FALSE)
#  pharmacist_name        :string
#  pharmacist_update_time :datetime
#  pharmacist_updated     :boolean          default(FALSE)
#  temperature            :string
#  treatment              :string
#  weight                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  department_id          :uuid
#
# Indexes
#
#  index_records_on_department_id  (department_id)
#
# Foreign Keys
#
#  fk_rails_...  (department_id => departments.id)
#

class Record < ApplicationRecord
	belongs_to :department
	has_many :record_icds
	has_many :icds, through: :record_icds

	validates :dob, :presence => true

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

  self.per_page = 10

end
