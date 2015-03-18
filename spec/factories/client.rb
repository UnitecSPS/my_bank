FactoryGirl.define do
  factory :client do
    name "Carlos Gochez"
    sequence :identity do |n|
      "0101-1982-#{n}"
    end
  end
end