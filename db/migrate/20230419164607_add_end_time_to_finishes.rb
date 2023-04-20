class AddEndTimeToFinishes < ActiveRecord::Migration[6.1]
  def change
    add_column :finishes, :end_time, :datetime
  end
end
