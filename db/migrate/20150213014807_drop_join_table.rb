class DropJoinTable < ActiveRecord::Migration
  def change
    drop_table :account_types_transactions
  end
end
