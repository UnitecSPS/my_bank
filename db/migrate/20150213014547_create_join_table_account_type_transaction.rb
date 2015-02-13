class CreateJoinTableAccountTypeTransaction < ActiveRecord::Migration
  def change
    create_join_table :account_types, :transactions do |t|
      # t.index [:account_type_id, :transaction_id]
      # t.index [:transaction_id, :account_type_id]
    end
  end
end
