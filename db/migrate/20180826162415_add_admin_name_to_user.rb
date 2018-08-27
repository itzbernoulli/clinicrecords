class AddAdminNameToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :admin_name, :string
    add_column :users, :admin_update_time, :datetime
  end
end
