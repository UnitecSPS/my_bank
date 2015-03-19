require "rails_helper"

describe BankAccountsController do
  
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  it "puede desplegar el show" do
    
    account = FactoryGirl.create(:bank_account)
    get :show, {id: account.id}, user_id: @user.id
    expect(response).to be_success
  end

  it "despliega un error si el id no existe" do
    expect{get :show, {id: 123}, user_id: @user.id}.to raise_error(ActiveRecord::RecordNotFound)
  end
end