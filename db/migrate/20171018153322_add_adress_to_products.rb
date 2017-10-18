class AddAdressToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :address, :string
  end
end
