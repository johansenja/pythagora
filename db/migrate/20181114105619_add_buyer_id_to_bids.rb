class AddBuyerIdToBids < ActiveRecord::Migration[5.2]
  def change
    add_reference :bids, :buyer, index: true
    add_foreign_key :bids, :users, column: :buyer_id, primary_key: :id
  end
end
