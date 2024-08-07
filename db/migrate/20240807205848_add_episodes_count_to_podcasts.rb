class AddEpisodesCountToPodcasts < ActiveRecord::Migration[7.0]
  def change
    add_column :podcasts, :episodes_count, :integer, default: 0, null: false
  end
end
