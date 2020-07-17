class Ride < ApplicationRecord
  validates_presence_of :name, :rating
  belongs_to :park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics
end
