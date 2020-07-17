require 'rails_helper'

RSpec.describe "mechanics index page" do
  before :each do
    @sam = Mechanic.create!(name: "Sam Mills", experience: 10)
    @kara = Mechanic.create!(name: "Kara Smith", experience: 11)
  end
  it "displays all mechanics and their info" do
    visit '/mechanics'

    expect(page).to have_content("All Mechanics")
    expect(page).to have_content("Sam Mills - 10 years of experience")
    expect(page).to have_content("Kara Smith - 11 years of experience")
  end
end



# Story 1
# As a user,
# When I visit a mechanics index page
# I see a header saying “All Mechanics”
# And I see a list of all mechanic’s names and their years of experience
# Ex:
#              All Mechanics
#    Sam Mills - 10 years of experience
#    Kara Smith - 11 years of experience
#
