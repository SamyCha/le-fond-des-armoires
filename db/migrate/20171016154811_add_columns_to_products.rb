class AddColumnsToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :type, :string
    add_column :products, :sexe, :string
    add_column :products, :marque, :string
    add_column :products, :taille, :integer
    add_column :products, :etat, :string
    add_column :products, :couleur, :string
    add_column :products, :matiere, :string
  end
end
