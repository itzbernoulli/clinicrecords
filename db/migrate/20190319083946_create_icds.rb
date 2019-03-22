class CreateIcds < ActiveRecord::Migration[5.0]
  def change
    create_table :icds do |t|
      t.string :code
      t.string :title

      t.timestamps
    end
  end
end
