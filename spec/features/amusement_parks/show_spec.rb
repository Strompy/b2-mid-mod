require 'rails_helper'

RSpec.describe "amusement park show page" do
  before :each do
    @park1 = Park.create!(name: "Thrill Gardens", price: 100)
    @ride1 = Ride.create!(name: "Lightning Racer", rating: 7, park_id: @park1.id)
    @ride2 = Ride.create!(name: "Storm Runner", rating: 9, park_id: @park1.id)
    @ride3 = Ride.create!(name: "The Great Bear", rating: 5, park_id: @park1.id)
  end
  it "should" do
    visit "/parks/#{@park1.id}"

    expect(page).to have_content(@park1.name)
    expect(page).to have_content(@park1.price)

    expect(page.all("li")[0]).to have_content(@ride1.name)
    expect(page.all("li")[1]).to have_content(@ride2.name)
    expect(page.all("li")[2]).to have_content(@ride3.name)

    expect(page).to have_content("Average Thrill Rating of Rides: 7.0/10")
  end
end


# Story 2
# As a visitor,
# When I visit an amusement park’s show page
# I see the name and price of admissions for that amusement park
# And I see the names of all the rides that are at that theme park listed in alphabetical order
# And I see the average thrill rating of this amusement park’s rides
# Ex: Hershey Park
#    Admissions: $50.00
#
#    Rides:
#           1. Lightning Racer
#           2. Storm Runner
#           3. The Great Bear
#    Average Thrill Rating of Rides: 7.8/10
