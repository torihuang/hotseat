class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :game_id
      t.string  :question
      t.string  :answer


      t.timestamps null: false
    end
  end
end
