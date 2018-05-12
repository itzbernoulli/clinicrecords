class CreateMerchants < ActiveRecord::Migration[5.0]
  def change
    create_table :merchants do |t|
      t.string :instagram
      t.string :facebook
      t.string :twitter
      t.string :website
      t.string :feature_image
      t.string :short_description
      t.string :long_description
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
