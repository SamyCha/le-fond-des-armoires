class AddTailleToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :taille, :string
  end
end
