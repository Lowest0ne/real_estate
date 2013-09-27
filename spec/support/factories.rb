FactoryGirl.define do

  factory :building do
    street_address '33 Harrison ave'
    city 'Boston'
    state 'Massachusetts'
    postal_code '02111'
    description 'a hotspot for tech growth in Boston'
  end

  factory :owner do
    first_name 'Carl'
    last_name 'Schwope'
    email 'schwope.carl@gmail.com'
    company 'Launch Academy'
  end

  factory :tennant do
    first_name 'Carl'
    last_name 'Schwope'
    email 'howdidthis@happen.com'
  end

end
