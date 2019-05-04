# == Schema Information
#
# Table name: icds
#
#  id         :uuid             not null, primary key
#  code       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Icd < ApplicationRecord
	has_many :record_icds
	has_many :records, through: :record_icds
end
