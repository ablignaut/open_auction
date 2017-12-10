class CreateBids < ActiveRecord::Migration[5.1]
  def change
    create_table :bids do |t|
      t.references :user
      t.references :auction
      t.decimal :value, precision: 10, scale: 2, default: 0

      t.timestamps
    end
  end
end
