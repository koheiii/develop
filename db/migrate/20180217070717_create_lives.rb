class CreateLives < ActiveRecord::Migration[5.1]
  def change
    create_table :lives do |t|
      t.integer :user_id
      t.string :day
      t.string :band
      t.string :live_title

      t.timestamps
    end
  end
end
