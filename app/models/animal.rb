class Animal < ApplicationRecord
    belongs_to :sighting
    validates :name, presence: true, uniqueness: true
end
