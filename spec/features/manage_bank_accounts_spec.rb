require "rails_helper"

describe "Procesos sobre cuentas bancarias" do
  
  before(:each) do
    @user = FactoryGirl.create(:user, email: "yo@unitec.edu")
    @account = FactoryGirl.create(:bank_account)
    visit login_path
    fill_in "session_email", with: @user.email
    fill_in "session_password", with: "unitec"
    click_button "Login"
  end
  
  context "Index page" do

    before(:each) do
      visit bank_accounts_path
    end

    it "lista todas las accounts creadas" do
      expect(page).to have_content("Carlos Gochez")
      expect(page).to have_content("VIP")
      expect(page).to have_content(500)
      expect(page).to have_link(@account.id, 
        href: "/bank_accounts/#{@account.id}")
    end

    it "calcula los intereses" do
      expect(page).to have_link("Registrar Intereses", 
        href: "/bank_accounts/intereses")
      click_link "Registrar Intereses"
      #500 + 500 * 0,4 = 700
      expect(page).to have_content(700)
      expect(current_path).to eq(bank_accounts_path)
    end
  end

  context "Show Page" do
    before(:each) do
      visit bank_account_path(@account)
    end

    it "muestra los datos de la bank account" do
      expect(page).to have_content("Carlos Gochez")
      expect(page).to have_content("VIP")
      expect(page).to have_content(500)
    end

    it "puede llamar la opcion de depositar" do
      click_link "Depositar"
      fill_in "transaction_responsible", with: "Patito"
      fill_in "transaction_amount", with: 500
      click_button "Depositar"
      expect(current_path).to eq(bank_account_path(@account))
      expect(page).to have_content(1000)
    end

    it "puede llamar la opcion de retirar" do
      click_link "Retirar"
      fill_in "transaction_responsible", with: "Patito"
      fill_in "transaction_amount", with: 300
      click_button "Retirar"
      expect(current_path).to eq(bank_account_path(@account))
      expect(page).to have_content(200)
    end
  end

  context "new" do
    before(:each) do
      FactoryGirl.create(:vip)
      FactoryGirl.create(:normal)
      FactoryGirl.create(:client)
      FactoryGirl.create(:client, name: "David Bermudez")
    end

    it "puede crear una nueva cuenta" do
      visit bank_accounts_path
      click_link "Nueva Cuenta"
      select "David Bermudez", from: "bank_account_client_id"
      select "NORMAL", from: "bank_account_account_type_id"
      select "Dolares", from: "bank_account_currency"
      click_button "Create Bank account"
      expect(current_path).to eq(bank_accounts_path)
      expect(page).to have_content("Cuenta creado exitosamente")
      expect(page).to have_content("David Bermudez")
      expect(page).to have_content("NORMAL")
    end
  end
end