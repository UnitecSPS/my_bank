class TransactionsController < ApplicationController
  def new
    @type = params[:transaction_type]
    @bank_account = BankAccount.find(params[:id])
    @transaction = Transaction.new(transaction_type: @type)
  end

  def create

  end
end