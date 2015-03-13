class Client < ActiveRecord::Base
	validates_presence_of :name, :identity
	validates_uniqueness_of :identity
	validates_uniqueness_of :email, allow_blank: true
  validates_length_of :phone, is: 8, allow_blank: true

  has_many :bank_accounts
  has_many :transactions, through: :bank_accounts
  accepts_nested_attributes_for :bank_accounts, reject_if: :all_blank


  def graph_data
    total = self.transactions.count
    deposits = self.transactions.where(transaction_type: "deposit").count
    retires = self.transactions.where(transaction_type: "retire").count

    { 
      total: total,
      deposits: deposits.fdiv(total).round(2) * 100,
      retires: retires.fdiv(total).round(2) * 100
    }.to_json

  end
end
