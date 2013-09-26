require 'spec_helper'

feature 'owners can be recorded',%Q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
}do

#Acceptance Criteria:
#
# * I must specify a first name, last name, and email address
# * I can optionally specify a company name
# * If I do not specify the required information, I am presented with errors
# * If I specify the required information, the owner is recorded and I am redirected to enter another new owner
  scenario 'with valid information' do

    prev_count = Owner.count
    owner = FactoryGirl.build( :owner )

    visit new_owner_path

    fill_in 'First name', with: owner.first_name
    fill_in 'Last name', with: owner.last_name
    fill_in 'Email', with: owner.email
    fill_in 'Company', with: owner.company
    click_on 'Create Owner'

    expect( Owner.count ).to eql( prev_count + 1)

    page.should have_content('Owner has been created')

    page.current_path.should eql( new_owner_path )

  end

  scenario 'with invalid information' do
    prev_count = Owner.count
    visit new_owner_path
    click_on 'Create Owner'

    expect( Owner.count ).to eql( prev_count )

    page.should_not have_content('Owner has been created')
    page.should have_content("First name can't be blank")
    page.should have_content("Last name can't be blank")
    page.should have_content("Email can't be blank")

  end

end

