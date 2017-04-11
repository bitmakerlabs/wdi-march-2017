class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|
      t.string :title
      t.string :director
      t.integer :year

      t.timestamps
    end
  end
end
