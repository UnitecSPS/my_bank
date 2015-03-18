FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "email#{n}@unitec.edu"
    end
    password "unitec"
    password_confirmation "unitec"
  end
end