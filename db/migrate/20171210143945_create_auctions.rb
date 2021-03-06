class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.string :name, limit: 40, null: false
      t.string :description, limit: 255, null: false
      t.decimal :start_value, precision: 10, scale: 2, default: 0
      t.decimal :ending_value, precision: 10, scale: 2, default: 0
      t.decimal :current_value, precision: 10, scale: 2, default: 0
      t.boolean :ending, default: false
      t.attachment :image

      t.timestamps
    end
  end
end
