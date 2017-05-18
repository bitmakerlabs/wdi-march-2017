class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :slug
      t.string :title
      t.string :content
    end
  end
end
