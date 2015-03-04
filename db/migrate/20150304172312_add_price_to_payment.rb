class AddPriceToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :price, :string
  end
end
