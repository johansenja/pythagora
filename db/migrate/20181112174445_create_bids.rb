class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.references :job, foreign_key: true
      t.references :developer
      t.boolean :successful

      t.timestamps
    end

    add_foreign_key :bids, :users, column: :developer_id, primary_key: :id
  end
end
