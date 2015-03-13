class Client < ActiveRecord::Base
	validates_presence_of :name, :identity
	validates_uniqueness_of :identity
	validates_uniqueness_of :email, allow_blank: true
  validates_length_of :phone, is: 8, allow_blank: true

  has_many :bank_accounts
  has_many :transactions, through: :bank_accounts

  accepts_nested_attributes_for :bank_accounts, reject_if: :all_blank

  def build_transactions_report
    total = self.transactions.count
    deposit = self.transactions.where(transaction_type: "deposit").count
    retire = transactions.where(transaction_type: "retire").count
    {total: total, deposit: deposit.fdiv(total).round(2)*100, retire: retire.fdiv(total).round(2)*100 }
  end
end
