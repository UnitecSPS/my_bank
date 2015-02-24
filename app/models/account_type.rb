class AccountType < ActiveRecord::Base
  has_many :bank_accounts
  validates_presence_of :title, :rate, :min_deposit
  validates_numericality_of :rate, :min_deposit, greater_than_or_equal_to: 0
end
