class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :body
      t.string :image_id
      t.string :song_tag

      t.timestamps
    end
  end
end
