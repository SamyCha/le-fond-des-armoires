# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
puts "All tables are destroyed !"
puts "Generating random users"

#products
veste = Product.create!( title: "Veste Perfecto", category: "Veste", address: "place d'italie Paris", description: "Veste en cuir trés bon état", price: 200, sexe: "homme", taille: "54", marque: "Perfecto", etat: "bon état", matiere: "cuir", couleur: "noire")
ballerines = Product.create!( title: "Ballerines Repetto", category: "Chaussures", address: "avenue des Gobelins Paris", description: "Ballerines jamais servies", price: 90, sexe: "femme", taille: "39", marque: "Repetto", etat: "bon état", matiere: "cuir", couleur: "noire")
pull = Product.create!( title: "Pull Chevignon", category: "Pull", address: "Place Gambetta Sainte-Foy-La-Grande", description: "Pull old school", price: 9, sexe: "homme", taille: "48", marque: "Chevignon", etat: "bon état", matiere: "coton", couleur: "beige")
jean = Product.create!( title: "Jean Diesel", category: "Pantallon", address: "boulevard Garnier Royan", description: "Jean delavé", price: 29, sexe: "femme", taille: "36", marque: "Diesel", etat: "bon état", matiere: "jean", couleur: "bleu")
veste2 = Product.create!( title: "Veste Sandro", category: "Veste", address: "place d'italie Paris", description: "Veste en cuir trés bon état", price: 200, sexe: "homme", taille: "54", marque: "Perfecto", etat: "bon état", matiere: "cuir", couleur: "noire")
ballerines2 = Product.create!( title: "Talons JB Martin", category: "Chaussures", address: "avenue des Gobelins Paris", description: "Ballerines jamais servies", price: 19, sexe: "femme", taille: "39", marque: "Repetto", etat: "bon état", matiere: "cuir", couleur: "noire")
pull2 = Product.create!( title: "Pull Creeks", category: "Pull", address: "Place Gambetta Sainte-Foy-La-Grande", description: "Pull old school", price: 9, sexe: "homme", taille: "48", marque: "Chevignon", etat: "bon état", matiere: "coton", couleur: "beige")
jean2 = Product.create!( title: "Jean Le Temps des Cerises", category: "Pantallon", address: "boulevard Garnier Royan", description: "Jean delavé", price: 29, sexe: "femme", taille: "36", marque: "Diesel", etat: "bon état", matiere: "jean", couleur: "bleu")

#users
client1 = User.create!(first_name: "Samy", last_name: "Chalak", address:"Bordeaux", phone:"061011121314", email:"samy@gmail.com", password:"123456", state:0 )
vendeur1 = User.create!(first_name: "Sarah", last_name: "Chalak", address:"Paris", phone:"061011121314", email:"sarah@gmail.com", password:"123456", state:1 )
