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
require "json"

User.destroy_all
Activity.destroy_all
Theme.destroy_all
puts 'Creating users...'

user_data = [
  { first_name: "Oscar", last_name: "Dupond", password: "password", email: "oscar@gmail.com", age: "25" },
  { first_name: "Guillaume", last_name: "Dupuis", password: "password", email: "guillaume@gmail.com", age: "36" },
  { first_name: "Thomas", last_name: "Dubois", password: "password", email: "thomas@gmail.com", age: "31" }

]

user_data.each do |data|
  user = User.create!(
    first_name: data[:first_name],
    last_name: data[:last_name],
    password: data[:password],
    email: data[:email],
    age: data[:age]
  )
end

puts 'Creating activitys...'

activity_data = [
  { name: "Atelier de Poterie Terre & Créativité", brand: "Poterie family", adress: "19 rue de la barre 59800 Lille", content: "Commentaire: Plongez dans le monde apaisant de la poterie et laissez votre créativité s'exprimer en modelant l'argile.", date_begin: "8 decembre 2023", date_end: "8 decembre 2023", website: "https://poteriefamily.com/", photo: "https://www.parlonspeinture.com/wp-content/uploads/2021/06/poterie-1080x675.jpg", category:"autour_de_moi"},
  { name: "Randonnée Exploration", brand: "Komoot randonnée", adress: "142 Rue Solférino, 59000 Lille", content: "Partez à l'aventure à travers des sentiers secrets, explorez des paysages préservés et respirez l'air pur de la nature.", date_begin: "9 decembre 2023", date_end: "9 decembre 2023", website: "https://www.komoot.com/fr-fr/guide/1524733/randonnees-autour-de-lille" , photo: "https://sportsdenature16.lacharente.fr/fileadmin/user_upload/SSN/4-Activites/Randonnee_AdobeStock_34807269.jpg", category:"autour_de_moi"},
  { name: "Cours de Cuisine Saveurs du Monde", brand: "Atelier des chefs", adress: "91-95 Rue de la Monnaie, 59800 Lille", content: "Découvrez les secrets culinaires du monde entier et apprenez à concocter des plats délicieux et authentiques.", date_begin: "10 decembre 2023", date_end: "10 decembre 2023", website: "https://www.atelierdeschefs.fr/ateliers/25/lille/", photo: "https://www.sortiraparis.com/images/80/63637/371508-l-atelier-des-chefs-des-cours-de-cuisine-a-paris.jpg", category:"autour_de_moi"},
  { name: "Séance de Yoga Harmonie & Sérénité", brand: "Yoga studio", adress: "201 rue Charles de Gaulle, 59110 La Madeleine", content: "Retrouvez l'harmonie du corps et de l'esprit à travers des séances de yoga apaisantes, idéales pour se recentrer.", date_begin: "8 decembre 2023", date_end: "8 decembre 2023", website: "https://www.yogastudiolille.fr/" , photo: "https://www.thermesdenoirmont.be/wp-content/uploads/2020/05/YogaOKWeb.jpg", category:"autour_de_moi"},
  { name: "Club de Lecture", brand: "Lille aux livres", adress: "3 Rue de la Digue, 59000 Lille", content: "Plongez dans des univers variés, discutez de vos lectures préférées et découvrez de nouveaux auteurs au sein d'une communauté passionnée.", date_begin: "9 decembre 2023", date_end: "9 decembre 2023", website: "https://lilleauxlivres.wordpress.com/" , photo: "https://static.pratique.fr/images/unsized/ve/vendredi-lecture-les-clubs-de-lecture-sont-encore-tendance-au-21eme-siecle-istock-com-emirmemedovski-204-1499244394.jpg", category:"autour_de_moi"},
  { name: "Cours de Photographie", brand: "Les photographes", adress: "2 Rue du Faubourg des Postes, 59000 Lille", content: "Apprenez à immortaliser des moments uniques et à perfectionner vos compétences en photographie, encadré par des professionnels passionnés.", date_begin: "10 decembre 2023", date_end: "10 decembre 2023", website: "https://lesphotographes.org/fr/lille?city=lille" , photo: "https://i.pinimg.com/originals/28/b6/aa/28b6aa0df670ca9a2369e27017492045.jpg", category:"autour_de_moi"},
  { name: "Club de Théâtre Scènes & Emotions", brand: "Comedie de lille", adress: "15 Pl. du Général de Gaulle, 59800 Lille", content: "Plongez dans l'univers captivant du théâtre, explorez différentes techniques d'interprétation et laissez libre cours à vos émotions sur scène.", date_begin: "8 decembre 2023", date_end: "8 decembre 2023", website: "https://www.comediedelille.fr/" , photo: "https://www.chimieparistech.psl.eu/wp-content/uploads/2019/10/senlis-4.jpg", category:"autour_de_moi"},
  { name: "Cours de Jardinage Nature en Fleurs", brand: "Mon coach jardin", adress: "Esplanade du Champ de Mars, 1 All. des Marronniers, 59800 Lille", content: "Découvrez l'art du jardinage, apprenez à cultiver des plantes et à créer des espaces extérieurs harmonieux et colorés.", date_begin: "9 decembre 2023", date_end: "9 decembre 2023", website: "https://moncoachjardin.com/cours-de-jardinage-lille/", photo: "https://www.ndpo.fr/app/uploads/sites/5/2021/05/club-jardinage-1536x1024.jpg", category:"autour_de_moi"},
  { name: "Cours de Danse", brand: "Jacquemin", adress: "100 Av. Willy Brandt, 59777 Lille", content: "Explorez la diversité des danses du monde entier, apprenez différentes chorégraphies et laissez-vous emporter par la musique.", date_begin: "10 decembre 2023", date_end: "10 decembre 2023", website: "https://academie-de-danse-jacquemin.com/", photo: "https://paris.nsworld.fr/public/img/big/SON01020jpg_5e3016609331f.jpg", category:"autour_de_moi"},
  { name: "Entraînement en Plein Air ", brand: "My oxygene", adress: "1 Rue de la Communauté, 59110 La Madeleine", content: "Rejoignez des sessions d'entraînement en groupe, mélangeant cardio, renforcement musculaire et exercices de mobilité pour booster votre énergie et votre forme.", date_begin: "8 decembre 2023", date_end: "8 decembre 2023", website: "https://www.myoxygene.fr/", photo: "https://www.jecoursqc.com/wp-content/uploads/2018/06/CQC_03-8458-1.jpg", category:"autour_de_moi"},
  { name: "Sofiane Pamart", brand: "Zenith de Lille", adress: "1 Bd des Cités Unies, 59800 Lille", content: "Habitué des scènes prestigieuses en France et à l’international, Sofiane Pamart est le premier pianiste soliste à jouer à guichets fermés dans la célèbre salle de l’Accor Arena à Paris.", date_begin: "9 decembre 2023", date_end: "9 decembre 2023", website: "https://www.zenithdelille.com/programmation/sofiane-pamart/", photo:"https://www.oulille.com/IMG/jpg/img_9598.jpg", category:"autour_de_moi"}
]

activity_data.each do |data|
  photo = URI.open(data[:photo])
  activity = Activity.create!(
    name: data[:name],
    brand: data[:brand],
    address: data[:adress],
    content: data[:content],
    date_begin: data[:date_begin],
    date_end: data[:date_end],
    website: data[:website],
    category: data[:category]
  )
  activity.photo.attach(io: photo, filename: data[:photo], content_type: "#{File.extname(data[:photo])}")
end

puts 'Creating themes...'

theme_data = [
  { name: "autour_de_moi", display_name: "Événements éphémères", photo: "https://images.pexels.com/photos/433452/pexels-photo-433452.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"},
  { name: "gym", display_name: "Sport", photo: "https://images.pexels.com/photos/221247/pexels-photo-221247.jpeg?auto=compress&cs=tinysrgb&w=800"},
  { name: "art_gallery", display_name: "Galerie d'art", photo: "https://images.pexels.com/photos/2372979/pexels-photo-2372979.jpeg"},
  { name: "night_club", display_name: "Faire la fête", photo: "https://images.pexels.com/photos/1763075/pexels-photo-1763075.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"},
  { name: "movie_theater", display_name: "Cinéma", photo: "https://images.pexels.com/photos/33129/popcorn-movie-party-entertainment.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"},
  { name: "amusement_park", display_name: "Parcs de loisirs", photo: "https://images.pexels.com/photos/3810967/pexels-photo-3810967.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"},
  { name: "museum", display_name: "Musée", photo: "https://images.pexels.com/photos/69903/pexels-photo-69903.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"}
]

theme_data.each do |data|
  photo = URI.open(data[:photo])
  theme = Theme.create!(
    name: data[:name],
    display_name: data[:display_name]
  )
  theme.photo.attach(io: photo, filename: data[:photo], content_type: "#{File.extname(data[:photo])}")
end

url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=50.6292,3.0573&radius=10000&type=museum&key=#{ENV['GOOGLE_API_KEY']}"
data_serialized = URI.open(url).read
data = JSON.parse(data_serialized)

data["results"].each do |museum|
  p "creating #{museum["name"]}"
  if museum['photos']

    photo_reference = museum["photos"].first["photo_reference"]
    activity = Activity.new(name: museum["name"], address: museum["vicinity"], category: "museum")
    photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo_reference}&key=#{ENV['GOOGLE_API_KEY']}"
    p photo_url
    file = URI.open(photo_url)
    activity.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    activity.save
  end
end

url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=50.6292,3.0573&radius=10000&category=gym&key=#{ENV['GOOGLE_API_KEY']}"
data_serialized = URI.open(url).read
data = JSON.parse(data_serialized)

data["results"].each do |gym|
  p "creating #{gym["name"]}"
  if gym['photos']

    photo_reference = gym["photos"].first["photo_reference"]
    activity = Activity.new(name: gym["name"], address: gym["vicinity"], category: "gym")
    photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo_reference}&key=#{ENV['GOOGLE_API_KEY']}"
    p photo_url
    file = URI.open(photo_url)
    activity.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    activity.save
  end
end

url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=50.6292,3.0573&radius=10000&type=art_gallery&key=#{ENV['GOOGLE_API_KEY']}"
data_serialized = URI.open(url).read
data = JSON.parse(data_serialized)

data["results"].each do |art_gallery|
  p "creating #{art_gallery["name"]}"
  if art_gallery['photos']

    photo_reference = art_gallery["photos"].first["photo_reference"]
    activity = Activity.new(name: art_gallery["name"], address: art_gallery["vicinity"], category: "art_gallery")
    photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo_reference}&key=#{ENV['GOOGLE_API_KEY']}"
    p photo_url
    file = URI.open(photo_url)
    activity.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    activity.save
  end
end

url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=50.6292,3.0573&radius=10000&type=night_club&key=#{ENV['GOOGLE_API_KEY']}"
data_serialized = URI.open(url).read
data = JSON.parse(data_serialized)

data["results"].each do |night_club|
  p "creating #{night_club["name"]}"
  if night_club['photos']

    photo_reference = night_club["photos"].first["photo_reference"]
    activity = Activity.new(name: night_club["name"], address: night_club["vicinity"], category: "night_club")
    photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo_reference}&key=#{ENV['GOOGLE_API_KEY']}"
    p photo_url
    file = URI.open(photo_url)
    activity.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    activity.save
  end
end

url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=50.6292,3.0573&radius=10000&type=movie_theater&key=#{ENV['GOOGLE_API_KEY']}"
data_serialized = URI.open(url).read
data = JSON.parse(data_serialized)

data["results"].each do |movie_theater|
  p "creating #{movie_theater["name"]}"
  if movie_theater['photos']

    photo_reference = movie_theater["photos"].first["photo_reference"]
    activity = Activity.new(name: movie_theater["name"], address: movie_theater["vicinity"], category: "movie_theater")
    photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo_reference}&key=#{ENV['GOOGLE_API_KEY']}"
    p photo_url
    file = URI.open(photo_url)
    activity.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    activity.save
  end
end

url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=50.6292,3.0573&radius=10000&type=amusement_park&key=#{ENV['GOOGLE_API_KEY']}"
data_serialized = URI.open(url).read
data = JSON.parse(data_serialized)

data["results"].each do |amusement_park|
  p "creating #{amusement_park["name"]}"
  if amusement_park['photos']

    photo_reference = amusement_park["photos"].first["photo_reference"]
    activity = Activity.new(name: amusement_park["name"], address: amusement_park["vicinity"], category: "amusement_park")
    photo_url = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=#{photo_reference}&key=#{ENV['GOOGLE_API_KEY']}"
    p photo_url
    file = URI.open(photo_url)
    activity.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
    activity.save
  end
end

puts 'Finished!'
