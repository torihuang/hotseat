class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :game_id
      t.string  :query
      t.string  :answer
      t.attachment :image

      t.integer :video_id

      t.timestamps null: false
    end
  end
end
