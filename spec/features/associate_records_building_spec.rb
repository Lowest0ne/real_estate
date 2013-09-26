require 'spec_helper'

feature 'associate records building',%Q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
}do

#Acceptance Criteria:
#
# * I must specify a street address, city, state, and postal code
# * Only US states can be specified
# * I can optionally specify a description of the building
# * If I enter all of the required information in the required format, the building is recorded.
# * If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
# * Upon successfully creating a building, I am redirected so that I can record another building.


  scenario 'with valid information' do

    prev_count = Building.count
    building = FactoryGirl.build( :building )

    visit new_building_path
    fill_in 'Street address', with: building.street_address
    fill_in 'City', with: building.city
    select building.state, from: 'State'
    fill_in 'Postal code', with: building.postal_code
    fill_in 'Description', with: building.description

    click_on 'Create Building'

    expect( Building.count ).to eql( prev_count + 1)

    page.should have_content("Building has been created")

    page.current_path.should eql( new_building_path )
  end

  scenario 'with invalid information' do

    prev_count = Building.count
    visit new_building_path

    click_on 'Create Building'

    expect( Building.count ).to eql( prev_count )

    page.should_not have_content("Building has been created")

    page.should have_content("Street address can't be blank")
    page.should have_content("City can't be blank")
    page.should have_content("State is not included in the list")
    page.should have_content("Postal code can't be blank")
    page.should have_content("Postal code is not a number")
    page.should have_content("Postal code is the wrong length")
  end

end
