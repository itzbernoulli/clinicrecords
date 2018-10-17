class AddAdminNameToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :admin_name, :string
    add_column :records, :admin_update_time, :datetime
  end
end
