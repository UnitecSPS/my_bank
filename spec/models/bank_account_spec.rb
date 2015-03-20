require "rails_helper"

describe BankAccount, type: :model do
  let(:bank_account){ BankAccount.new(id:12, balance: 500) }

  context "#deposit" do
    it "suma un monto especifico al balance" do
      bank_account.deposit(200)
      expect(bank_account.balance).to eq(700)
    end

    it "no salva si el monto es nulo" do
      expect(bank_account.deposit(nil)).to be_falsey
      expect(bank_account.balance).to eq(500)
    end
  end

  context "#retire" do

  end

  context "#full_description" do
    it "arma un texto para la account" do
      bank_account.client = Client.new(name: "patito")
      bank_account.account_type = AccountType.new(title: "vip")
      expect(bank_account.full_description).to eq("12 - patito - vip")
    end
  end
end