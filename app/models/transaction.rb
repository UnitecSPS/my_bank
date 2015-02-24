class Transaction < ActiveRecord::Base
  belongs_to :bank_account
  validates_numericality_of :amount, greater_than_or_equal_to: 0
  validates_presence_of :responsible

  def generate
    bank_updated  = false

    case transaction_type
    when "deposit"
      bank_updated = self.bank_account.deposit(amount)
    when "retire"
      bank_updated = self.bank_account.retire(amount)
      unless bank_updated
        errors[:amount] << "Debe ser menor que el saldo."
      end
    end

    bank_updated && save
  end

  def decorate_amount
    "Lps. #{amount}"
  end
end
