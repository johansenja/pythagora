class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.string :price
      t.string :deadline
      t.string :contract_type
      t.string :completed, default: 'false'
      t.integer :stars
      t.references :developer
      t.references :buyer

      t.timestamps
    end

    add_foreign_key :jobs, :users, column: :developer_id, primary_key: :id
    add_foreign_key :jobs, :users, column: :buyer_id, primary_key: :id
  end
end
