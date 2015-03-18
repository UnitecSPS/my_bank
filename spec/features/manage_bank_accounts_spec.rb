require "rails_helper"

describe "Procesos sobre cuentas bancarias" do
  
  before(:each) do
    @user = FactoryGirl.create(:user, email: "yo@unitec.edu")
    visit login_path
    fill_in "session_email", with: @user.email
    fill_in "session_password", with: "unitec"
    click_button "Login"
  end

  context "Index page" do

    before(:each) do
      @account = FactoryGirl.create(:bank_account)
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
end