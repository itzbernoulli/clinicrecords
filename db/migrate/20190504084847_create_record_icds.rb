class CreateRecordIcds < ActiveRecord::Migration[5.0]
  def change
    create_table :record_icds, id: :uuid do |t|
      t.references :record, foreign_key: true, type: :uuid
      t.references :icd, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
