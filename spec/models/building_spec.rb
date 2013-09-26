require 'spec_helper'

describe Building do

  it { should validate_presence_of( :street_address ) }
  it { should validate_presence_of( :city ) }
  it { should validate_presence_of( :state ) }
  it { should validate_presence_of( :postal_code ) }

  it { should_not have_valid( :state ).when('JZ','JLO') }
  it { should_not have_valid( :postal_code ).when( 'notnumber', '1234', '123456')}

  it { should belong_to( :owner ) }

end
