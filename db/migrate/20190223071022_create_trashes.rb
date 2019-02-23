class CreateTrashes < ActiveRecord::Migration[6.0]
  def change
    create_table :trashes do |t|
      t.string :name
      t.string :name_furi
      t.integer :disposal_cost
      t.boolean :disposable, default: true
      t.string :import_file
      t.string :memo
      t.date :updated_on
      t.timestamps
    end
  end
end
