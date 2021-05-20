# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
response = HTTParty.get('https://pokeapi.co/api/v2/pokemon?limit=100000')
pokemonArray = response['results']
total = pokemonArray.count
count = 0
pokemonArray.each do |pokemonHash|
    pokemon = HTTParty.get(pokemonHash['url'])
    name = pokemon['name']
    img_url = pokemon['sprites']['front_default']
    weight = pokemon['weight']
    pokemonHash = {
        name: name,
        img_url: img_url,
        weight: weight
    }
    Pokemon.find_or_create_by(pokemonHash)
    system('clear')
    puts "Seeding Pokemon Data"
    puts "-----------------"
    puts "#{count/total.to_f*100}%"
    count += 1
end
puts "-----------------"
puts "Pokemon Data: 100%"
puts "Data Sucessfully Seeded!"
puts "-----------------"