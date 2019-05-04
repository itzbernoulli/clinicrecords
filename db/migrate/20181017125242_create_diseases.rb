class CreateDiseases < ActiveRecord::Migration[5.0]
  def change
    create_table :diseases, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
