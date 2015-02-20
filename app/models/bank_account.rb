class BankAccount < ActiveRecord::Base
  belongs_to :client
  belongs_to :account_type
  has_many :transactions

  before_save :call_before_safe
  before_create :set_default_balance
  after_save :call_after_save
  after_create :call_after_create

  def self.currency_available_for_select
    ["Lempiras", "Dolares"]
  end 

  private

    def call_before_safe
      puts "Se llamo el before Save"
    end

    def set_default_balance
      puts "Se llamo el before_create"
      self.balance = self.account_type.min_deposit
    end

    def call_after_save
      puts "Se llam el after save"
    end

    def call_after_create
      puts "Se llamo el after create"
    end
end
