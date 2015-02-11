class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.decimal :balance
      t.string :currency
      t.references :client, index: true
      t.references :account_type, index: true

      t.timestamps
    end
  end
end
