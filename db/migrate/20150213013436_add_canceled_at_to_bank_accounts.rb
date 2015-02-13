class AddCanceledAtToBankAccounts < ActiveRecord::Migration
  def change
    add_column :bank_accounts, :canceled_at, :datetime
  end
end
