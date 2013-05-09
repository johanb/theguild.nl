class AddSeasonAndEpisodeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :season, :integer, null: false
    add_column :events, :episode, :integer, null: false
  end
end
