class Sighting < ApplicationRecord
    has_many :animals
    has_many :endangered_animals
    validates :name
    validates :Location, presence: true
end
