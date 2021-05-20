class Pokemon < ApplicationRecord
    #     name: ‘pikachu’,
    # img_url: ‘pikachu.jpg’,
    # weight: ‘50 Ibs’
    scope :find_pokemon_by_name, -> (query) { self.where("name LIKE ?", "%#{query}%") }


end
