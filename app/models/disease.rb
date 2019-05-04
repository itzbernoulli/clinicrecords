# == Schema Information
#
# Table name: diseases
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Disease < ApplicationRecord
	has_one :appointment
end
