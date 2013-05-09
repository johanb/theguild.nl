class AddSeasonAndEpisodeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :slug, :string, null: false
    add_index :events, :slug, unique: true
  end
end
