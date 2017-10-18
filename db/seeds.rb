# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all

veste = Product.create(
  title: "Veste Perfecto",
  description: "Veste en cuir trés bon état",
  image_url: "bbbh",
  price: 200
)

ballerines = Product.create(
  title: "Ballerines Repetto",
  description: "Ballerines noires taille 39",
  image_url: "jjjjj",
  price: 35
)

