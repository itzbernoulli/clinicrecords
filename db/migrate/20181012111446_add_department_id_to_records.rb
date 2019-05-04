class AddDepartmentIdToRecords < ActiveRecord::Migration[5.0]
  def change
    add_reference :records, :department, foreign_key: true, type: :uuid
  end
end
