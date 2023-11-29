# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "open-uri"
Activity.destroy_all
User.destroy_all
puts 'Creating users...'

user_data = [
  { first_name: "Oscar", last_name: "Dupond", password: "password", email: "oscar@gmail.com", age: "25" },
  { first_name: "Guillaume", last_name: "Dupuis", password: "password", email: "guillaume@gmail.com", age: "36" },
  { first_name: "Thomas", last_name: "Dubois", password: "password", email: "thomas@gmail.com", age: "31" }

]

user_data.each do |data|
  image = URI.open(data[:image])
  user = User.create!(
    first_name: data[:first_name],
    last_name: data[:last_name],
    password: data[:password],
    email: data[:email],
    age: data[:age]
  )
  User.photo.attach(io: image, filename: data[:image], content_type: "#{File.extname(data[:image])}")
end

puts 'Creating activitys...'

activity_data = [
  { name: "Atelier de Poterie Terre & Créativité", brand: "Dépote ton pot", adress: "19 rue de la barre 59800 Lille", content: "Commentaire: Plongez dans le monde apaisant de la poterie et laissez votre créativité s'exprimer en modelant l'argile.", date_begin: "1er mars 2023", date_end: "1er mars 2023", website: "poteries.com" },
  { name: "Randonnée Exploration des Sentiers Cachés", brand: "Les petits pédestres", adress: "Place de Saintignon, 165 Av. de Bretagne, 59000 Lille", content: "Partez à l'aventure à travers des sentiers secrets, explorez des paysages préservés et respirez l'air pur de la nature.", date_begin: "10 avril 2023", date_end: "10 avril 2023", website: "Les_petits_pédestres.com" },
  { name: "Cours de Cuisine Saveurs du Monde", brand: "ChuiauTaké", adress: "108 Rue Turgot, 59000 Lille", content: "Découvrez les secrets culinaires du monde entier et apprenez à concocter des plats délicieux et authentiques.", date_begin: "5 mars 2023", date_end: "5 mars 2023", website: "ChuiauTaké.com"},
  { name: "Séance de Yoga Harmonie & Sérénité", brand: "Dans ta zenzenzen", adress: "Pl. de la Gare, 59110 La Madeleine", content: "Retrouvez l'harmonie du corps et de l'esprit à travers des séances de yoga apaisantes, idéales pour se recentrer.", date_begin: "15 mars 2023", date_end: "15 mars 2023", website: "benzbenz.com" },
  { name: "Club de Lecture ", brand: "Pages Enchantées", adress: "112 Rue Sadi Carnot, 59280 Armentières", content: "Plongez dans des univers variés, discutez de vos lectures préférées et découvrez de nouveaux auteurs au sein d'une communauté passionnée.", date_begin: "8 avril 2023", date_end: "8 avril 2023", website: "Pages-Enchantées.com" },
  { name: "Workshop de Photographie Capturer l'Instant", brand: "Claudie Flocant", adress: "19 rue de la république 59184 Sainghin-en-Weppes", content: "Apprenez à immortaliser des moments uniques et à perfectionner vos compétences en photographie, encadré par des professionnels passionnés.", date_begin: "3 mars 2023", date_end: "3 mars 2023", website: "Claudie_Flocant.com" },
  { name: "Club de Théâtre Scènes & Emotions", brand: "Ce soir on joue", adress: "369 rue de la musique 59500 Douai", content: "Plongez dans l'univers captivant du théâtre, explorez différentes techniques d'interprétation et laissez libre cours à vos émotions sur scène.", date_begin: "2 mars 2023", date_end: "2 mars 2023", website: "Ce_soir_on_joue.com" },
  { name: "Club de Jardinage Nature en Fleurs", brand: "Gazon Maudit", adress: "69 rue de l'herbe folle 59500 Douai", content: "Découvrez l'art du jardinage, apprenez à cultiver des plantes et à créer des espaces extérieurs harmonieux et colorés.", date_begin: "5 avril 2023", date_end: "5 avril 2023", website: "Gazon.Maudit.com"},
  { name: "Cours de Danse ", brand: "Rythmes du Monde", adress: "29 rue de la barre 59800 Lille", content: "Explorez la diversité des danses du monde entier, apprenez différentes chorégraphies et laissez-vous emporter par la musique.", date_begin: "8 mars 2023", date_end: "8 mars 2023", website: "rythme.com"},
  { name: "Entraînement en Plein Air ", brand: "Énergie en Mouvement", adress: "Parc Sportif Central, Avenue de l'Énergie, 56789 Ville Dynamique", content: "Rejoignez des sessions d'entraînement en groupe, mélangeant cardio, renforcement musculaire et exercices de mobilité pour booster votre énergie et votre forme.", date_begin: "5 avril 2023", date_end: "5 avril 2023", website: "Plein_Air.com"},
  { name: "Concert", brand: "500 voix pour Queen", adress: "1 boulevard des Cités Unies 59777 Lille-Euralille France", content: "Pour la première fois en Europe, 500 choristes rendront hommage à Freddie Mercury et au Groupe QUEEN. Des voix internationales incroyables, des musiciens de talent, 500 choristes, une mise en scène impressionnante, des effets spéciaux font de ce spectacle un moment inoubliable où le temps s’arrête pour retrouver pendant 2h l’atmosphère du groupe Queen !", date_begin: "Dimanche 28 Janvier", date_end: "Dimanche 28 Janvier", website: "https://www.zenithdelille.com/programmation/500-voix-pour-queen/"}
]

activity_data.each do |data|
  image = URI.open(data[:image])
  activity = Activity.create!(
    name: data[:name],
    brand: data[:brand],
    address: data[:adress],
    content: data[:content],
    date_begin: data[:date_begin],
    date_end: data[:date_end],
    website: data[:website]
  )
  Activity.photo.attach(io: image, filename: data[:image], content_type: "#{File.extname(data[:image])}")
end

puts 'Finished!'
