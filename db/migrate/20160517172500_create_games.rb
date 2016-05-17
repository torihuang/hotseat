class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :creator_id
      t.string  :title
      t.string  :victim
      t.string  :answerer
      t.string  :answerer_url_key

      t.timestamps null: false
    end
  end
end
