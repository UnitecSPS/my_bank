class BankAccount < ActiveRecord::Base
  belongs_to :client
  belongs_to :account_type
  has_many :transactions

  def self.currency_available_for_select
    ["Lempiras", "Dolares"]
  end 
end
