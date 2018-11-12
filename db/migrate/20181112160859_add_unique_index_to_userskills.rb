class AddUniqueIndexToUserskills < ActiveRecord::Migration[5.2]
  def change
    add_index :userskills, [:skill_id, :developer_id], unique: true
  end
end
