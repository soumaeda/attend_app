class CreateStarts < ActiveRecord::Migration[6.1]
  def change
    create_table :starts do |t|
      t.datetime :timestamp
      t.datetime :start_time
      t.integer :user_id

      t.timestamps
    end
  end
end
