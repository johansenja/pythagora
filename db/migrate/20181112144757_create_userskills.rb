class CreateUserskills < ActiveRecord::Migration[5.2]
  def change
    create_table :userskills do |t|
      t.references :skill, foreign_key: true
      t.references :developer

      t.timestamps
    end

    add_foreign_key :userskills, :users, column: :developer_id, primary_key: :id
  end
end
