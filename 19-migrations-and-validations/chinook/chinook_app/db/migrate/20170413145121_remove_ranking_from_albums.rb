class RemoveRankingFromAlbums < ActiveRecord::Migration[5.0]
  def change
    remove_column :albums, :ranking, :integer
  end
end
