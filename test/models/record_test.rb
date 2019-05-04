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

require 'test_helper'

class RecordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
