FactoryGirl.define do
  factory :vip, class: AccountType do
    title "VIP"
    rate 0.4
    min_deposit 500
  end

  factory :normal, class: AccountType do
    title "NORMAL"
    rate 0.2
    min_deposit 100
  end
end