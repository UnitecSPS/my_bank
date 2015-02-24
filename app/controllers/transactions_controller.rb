class TransactionsController < ApplicationController
  def index
    @bank_account = BankAccount.find(params[:bank_account_id])
    @transactions = @bank_account.transactions.order(created_at: :desc)
  end

  def new
    @type = params[:transaction_type]
    @bank_account = BankAccount.find(params[:id])
    @transaction = Transaction.new(transaction_type: @type)
  end

  def create
    @bank_account = BankAccount.find(params[:bank_account_id])
    @transaction = @bank_account.transactions.build(transaction_params)

    if @transaction.generate
      redirect_to @bank_account
    else
      @type = @transaction.transaction_type
      render :new
    end
  end

  private

    def transaction_params
      params.require(:transaction).permit!
    end
end
