class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.decimal :balance
      t.string :type_account
      t.decimal :rate
      t.string :currency
      t.references :client, index: true

      t.timestamps
    end
  end
end
