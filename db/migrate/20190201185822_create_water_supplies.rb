class CreateWaterSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :water_supplies do |t|
      t.string :provider
      t.references :house, foreign_key: true

      t.timestamps
    end
  end
end
