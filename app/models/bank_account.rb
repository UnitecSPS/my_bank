class BankAccount < ActiveRecord::Base
  belongs_to :client
  belongs_to :account_type
end
