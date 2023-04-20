class CreateFinishes < ActiveRecord::Migration[6.1]
  def change
    create_table :finishes do |t|
      t.datetime :timestamp

      t.timestamps
    end
  end
end
