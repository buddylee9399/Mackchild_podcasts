class CreatePodcasts < ActiveRecord::Migration[7.0]
  def change
    create_table :podcasts do |t|
      t.string :title
      t.text :description
      t.string :itunes
      t.string :stitcher
      t.string :podbay

      t.timestamps
    end
  end
end
