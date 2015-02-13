class RemoveTestRemoveFromTransactions < ActiveRecord::Migration
  def change
    remove_column :transactions, :test_remove, :string
  end
end
