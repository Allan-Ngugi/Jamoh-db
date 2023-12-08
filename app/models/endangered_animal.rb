class EndangeredAnimal < ApplicationRecord
    belongs_to :sighting
    validates :name, presence: true uniqueness: true
    validates :health, :age, presence: true
end
