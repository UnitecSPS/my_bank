class BankAccount < ActiveRecord::Base
  belongs_to :client
end
