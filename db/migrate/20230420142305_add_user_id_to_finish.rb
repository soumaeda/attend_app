class AddUserIdToFinish < ActiveRecord::Migration[6.1]
  def change
    add_column :finishes, :user_id, :integer
  end
end
