class RemoveSizeFromProducts < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :taille, :integer
  end
end
