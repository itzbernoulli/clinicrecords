# == Schema Information
#
# Table name: record_icds
#
#  id         :uuid             not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  icd_id     :uuid
#  record_id  :uuid
#
# Indexes
#
#  index_record_icds_on_icd_id     (icd_id)
#  index_record_icds_on_record_id  (record_id)
#
# Foreign Keys
#
#  fk_rails_...  (icd_id => icds.id)
#  fk_rails_...  (record_id => records.id)
#

require 'test_helper'

class RecordIcdTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
