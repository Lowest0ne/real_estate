require 'spec_helper'

feature 'owner can add a tenant',%Q{
  As an owner
  I want to add a tenant
  So that I can keep track of who is renting in my building
}do

# Acceptance Criteria:
#
# * I must specify a first name, last name, building they're renting in, and valid email address.
# * If the tenant information is valid, the tenant is associated with the building. The information is persisted.
# * If the tenant information is invalid, an error message is supplied so the landlord can fix the entry. The information is not persisted.
  scenario 'with valid information' do

    owner = FactoryGirl.create( :owner )
    owner.building = FactoryGirl.create( :building )
    tennant = FactoryGirl.build( :tennant )
    owners_tennants = owner.building.tennants.count

    prev_count = Tennant.count

    visit owner_path(owner)

    fill_in 'First name', with: tennant.first_name
    fill_in 'Last name', with: tennant.last_name
    fill_in 'Email', with: tennant.email
    select owner.building.street_address, from: 'address'

    click_on 'Create Tennant'

    expect( Tennant.count ).to eql( prev_count + 1 )
    expect( Owner.last.building.tennants.count ).to eql( owners_tennants + 1 )

  end

end

feature 'owner can view tennants',%Q{
  As an owner
  I want to view all of my tenants
  So that I can have a roster of those renting in my building
}do

#  Acceptance Criteria:
#
# * There is a page that lists all of my tenants sorted by last name and first name.
# * I can see where each tenant lives and what their email address is.
  scenario 'owner can see tenants' do
    owner = FactoryGirl.create( :owner )
    FactoryGirl.create( :building, owner: owner )
    FactoryGirl.create( :tennant, building: owner.building )
    owner.save
    tennant = owner.building.tennants.last

    visit owner_path( owner )
    page.should have_content( owner.building.street_address )
    page.should have_content( tennant.first_name )
    page.should have_content( tennant.last_name )
    page.should have_content( tennant.email )

  end

end

