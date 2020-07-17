require 'rails_helper'

RSpec.describe "mechanics show page" do
  before :each do
    @park1 = Park.create!(name: "Thrill Gardens", price: 100)
    @ride1 = Ride.create!(name: "Lightning Racer", rating: 7, park_id: @park1.id)
    @ride2 = Ride.create!(name: "Storm Runner", rating: 9, park_id: @park1.id)
    @ride3 = Ride.create!(name: "The Great Bear", rating: 5, park_id: @park1.id)

    @sam = Mechanic.create!(name: "Sam Mills", experience: 10, ride_ids: [@ride1.id, @ride2.id])
    @kara = Mechanic.create!(name: "Kara Smith", experience: 11)
  end
  it "displays specific mechanics info and current rides" do
    visit "/mechanics/#{@sam.id}"

    expect(page).to have_content("#{@sam.name}")
    expect(page).to have_content("#{@sam.experience}")
    within ".rides" do
      expect(page).to have_content("#{@ride1.name}")
      expect(page).to have_content("#{@ride2.name}")
    end
  end
  it "has a form to add ride to workload" do
    visit "/mechanics/#{@sam.id}"

    fill_in :ride_id, with: "#{@ride3.id}"

    click_button "Submit"

    expect(current_path).to eq("/mechanics/#{@sam.id}")
    
    within ".rides" do
      expect(page).to have_content("#{@ride1.name}")
      expect(page).to have_content("#{@ride2.name}")
      expect(page).to have_content("#{@ride3.name}")
    end
  end
end

# Story 3
# As a user,
# When I go to a mechanics show page
# I see their name, years of experience, and names of all rides they’re working on
# And I also see a form to add a ride to their workload
# When I fill in that field with an id of an existing ride and hit submit
# I’m taken back to that mechanics show page
# And I see the name of that newly added ride on this mechanics show page
# Ex:
# Mechanic: Kara Smith
# Years of Experience: 11
# Current rides they’re working on:
# The Frog Hopper
# Fahrenheit
# The Kiss Raise
# Add a ride to workload:
# _pretent_this_is_a_textfield_
#                       Submit
#
