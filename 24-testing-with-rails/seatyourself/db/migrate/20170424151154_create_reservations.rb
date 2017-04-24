class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :restaurant, foreign_key: true
      t.integer :party_size
      t.datetime :time

      t.timestamps
    end
  end
end
