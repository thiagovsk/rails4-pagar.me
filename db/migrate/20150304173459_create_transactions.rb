class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :amount
      t.string :card_hash
      t.references :payment, index: true

      t.timestamps null: false
    end
    add_foreign_key :transactions, :payments
  end
end
