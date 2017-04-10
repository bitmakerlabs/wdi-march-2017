class CreateRides < ActiveRecord::Migration[5.1]
  def change
    create_table :rides do |table|
      table.string :name
      table.string :description
      table.integer :tickets
      table.timestamps
    end
  end
end
