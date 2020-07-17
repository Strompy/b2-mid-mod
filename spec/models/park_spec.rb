require 'rails_helper'

RSpec.describe Park do
  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :price}
  end
  describe 'relationships' do
    it { should have_many :rides }
  end
  describe 'methods' do
    it "can calculate average thrill rating" do
      park = Park.create!(name: "Thrill Gardens", price: 100)
      ride1 = Ride.create!(name: "Lightning Racer", rating: 7, park_id: park.id)
      ride2 = Ride.create!(name: "Storm Runner", rating: 9, park_id: park.id)
      ride3 = Ride.create!(name: "The Great Bear", rating: 5, park_id: park.id)
      expect(park.ave_thrill_rating).to eq("7.0/10")
    end
    it "can return rides in alphabetical order" do
      park = Park.create!(name: "Thrill Gardens", price: 100)
      ride1 = Ride.create!(name: "Lightning Racer", rating: 7, park_id: park.id)
      ride2 = Ride.create!(name: "Storm Runner", rating: 9, park_id: park.id)
      ride3 = Ride.create!(name: "The Great Bear", rating: 5, park_id: park.id)

      expect(park.alphabetical_rides).to eq([ride1, ride2, ride3])
    end
  end
end
