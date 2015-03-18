FactoryGirl.define do
  factory :bank_account do
    client
    association :account_type, factory: :vip
  end
end