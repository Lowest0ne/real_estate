require 'spec_helper'

describe Owner do

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }

  it { should have_one( :building ) }

  it 'should clean up connection to building on destroy' do

    owner = FactoryGirl.create( :owner )
    owner.building = FactoryGirl.build( :building )

    expect( owner.save ).to be_true

    building = owner.building
    owner.destroy

    building.owner_id.should == nil
  end

  it { should have_many(:tennants).through(:building) }
end
