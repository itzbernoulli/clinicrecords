class AddIcdIdToRecord < ActiveRecord::Migration[5.0]
  def change
    add_reference :records, :icd, foreign_key: true
  end
end
