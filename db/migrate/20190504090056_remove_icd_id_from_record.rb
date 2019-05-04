class RemoveIcdIdFromRecord < ActiveRecord::Migration[5.0]
  def change
  	remove_column :records, :icd_id
  end
end
