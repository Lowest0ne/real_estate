require 'spec_helper'

describe Tennant do

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }

  it { should belong_to(:building) }

  pending "the email is valid"

end
