class ClientsController < ApplicationController
  def index
  	@clients = Client.order(:name)

    if params[:keyword].present?
      q = params[:keyword]
      @clients = @clients.where("identity LIKE '%#{q}%' OR  name LIKE '%#{q}%'")
    end

    if request.xhr?
      #render json: { keyword: params[:keyword], action: "index" }.to_json, status: 200
      render partial: "table", locals: {clients: @clients}, status: 200
    end
  end

  def show
  	@client = Client.find(params[:id])
  end

  def new
  	@client = Client.new(gender: "Masculino")
  end

  def create
    @client = Client.new(client_params)

    if @client.save
      redirect_to clients_path,
        flash: {notice: "Cliente creado exitosamente"}
    else
      render :new
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])

    if @client.update(client_params)
      redirect_to clients_path,
        flash: {notice: "Cliente editado exitosamente"}
    else
      render :edit
    end
  end

  def hackaccounts
    @client = Client.find(params[:id])
  end

  def report
    @client = Client.find(params[:id])
  end

  private

  	def client_params
  		params.require(:client).permit(:name,:identity, :gender,
  			:phone, :email, bank_accounts_attributes: [:id,:account_type_id,:balance] )
  	end
end
