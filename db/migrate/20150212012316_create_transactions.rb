class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.string :responsible
      t.string :transaction_type
      t.text :description
      t.references :bank_account, index: true

      t.timestamps
    end
  end
end
