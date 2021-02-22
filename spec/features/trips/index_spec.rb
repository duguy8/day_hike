require "rails_helper"

RSpec.describe "When I visit the hiking trips index page" do
  before :each do
    @hike1 = Trip.create!(
      name: "FlatIrons, CO"
    )
    @hike2 = Trip.create!(
      name: "14er, CO"
    )
    @hike3 = Trip.create!(
      name: "SLC, UT"
    )
  end

  it "Shows me a list of all trip names in the db" do

    visit trips_path

    expect(page).to have_content(@hike1.name)
    expect(page).to have_content(@hike2.name)
    expect(page).to have_content(@hike3.name)
  end

  it "Each trips name is a link to that hikes show page" do

    visit trips_path

    expect(page).to have_link(@hike1.name)
    expect(page).to have_link(@hike2.name)
    expect(page).to have_link(@hike3.name)

    click_link(@hike1.name)

    expect(current_path).to eq(trip_path(@hike1.id))
  end
end
