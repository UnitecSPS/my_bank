class AccountTypesController < ApplicationController
  def index
    @types = AccountType.order(:title)
  end

  def new
    @type = AccountType.new
  end

  def create
    @type = AccountType.new(account_type_params)

    if @type.save
      redirect_to account_types_path
    else
      render :new
    end
  end

  def edit
    @type = AccountType.find(params[:id])
  end

  def update
    @type = AccountType.find(params[:id])

    if @type.update(account_type_params)
      redirect_to account_types_path
    else
      render :edit
    end
  end

  private

    def account_type_params
      params.require(:account_type).permit!
    end
end
