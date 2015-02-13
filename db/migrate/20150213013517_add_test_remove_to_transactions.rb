class AddTestRemoveToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :test_remove, :string
  end
end
