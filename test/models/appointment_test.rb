# == Schema Information
#
# Table name: appointments
#
#  id               :uuid             not null, primary key
#  appointment_date :string
#  date_of_birth    :string
#  email            :string
#  message          :string
#  name             :string
#  phone            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  disease_id       :uuid
#
# Indexes
#
#  index_appointments_on_disease_id  (disease_id)
#
# Foreign Keys
#
#  fk_rails_...  (disease_id => diseases.id)
#

require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
