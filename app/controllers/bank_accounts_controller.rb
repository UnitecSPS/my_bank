class BankAccountsController < ApplicationController
  def index
    @bank_accounts = BankAccount.order(:created_at)
  end

  def show
    @bank_account = BankAccount.find(params[:id])
  end

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(bank_account_params)
    @bank_account.balance = @bank_account.account_type.min_deposit

    if @bank_account.save
      redirect_to bank_accounts_path,
        flash: {notice: "Cuenta creado exitosamente"}
    else
      render :new
    end
  end

  private

    def bank_account_params
      params.require(:bank_account).permit(:client_id, :account_type_id, :currency)
    end
end
