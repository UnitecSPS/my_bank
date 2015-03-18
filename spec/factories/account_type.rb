FactoryGirl.define do
  factory :vip, class: AccountType do
    title "VIP"
    rate 0.4
    min_deposit 500
  end
end