class Transaction < ActiveRecord::Base
  belongs_to :bank_account
  validates_numericality_of :amount, greater_than_or_equal_to: 0
  validates_presence_of :responsible
end
