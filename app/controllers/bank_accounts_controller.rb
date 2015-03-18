class BankAccountsController < ApplicationController
  def index
    @bank_accounts = BankAccount.includes(:client, :account_type).order(:created_at)
  
    if params[:keyword].present?
      q = params[:keyword]
      @bank_accounts = @bank_accounts.joins(:client, :account_type)
        .where("bank_accounts.id LIKE '%#{q}%' OR clients.name LIKE '%#{q}%' OR account_types.title LIKE '%#{q}%'")
    end

    if request.xhr?
      render partial: "table", locals: {bank_accounts: @bank_accounts}
    end
  end

  def show
    @bank_account = BankAccount.find(params[:id])
  end

  def new
    @bank_account = BankAccount.new
  end

  def create
    @bank_account = BankAccount.new(bank_account_params)

    if @bank_account.save
      redirect_to bank_accounts_path,
        flash: {notice: "Cuenta creado exitosamente"}
    else
      render :new
    end
  end

  def preview
    @bank_account = BankAccount.find(params[:id])
  end

  def stadistics
  end

  def deposit
    @bank_account = BankAccount.find(params[:id])
    @transaction = Transaction.new(transaction_type: "deposit")
  end

  def retire
    @bank_account = BankAccount.find(params[:id])
    @transaction = Transaction.new(transaction_type: "retire")
  end

  def intereses
    BankAccount.order(:id).each do |bk|
      bk.deposit(bk.balance*bk.account_type.rate)
    end
    redirect_to bank_accounts_path
  end

  private

    def bank_account_params
      params.require(:bank_account).permit(:client_id, :account_type_id, :currency)
    end
end
