class CreateCrewMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :crew_members do |t|
      t.string :first_name
      t.string :last_name
      t.string :rank
      t.belongs_to :spaceship, foreign_key: true

      t.timestamps
    end
  end
end
