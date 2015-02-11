class CreateAccountTypes < ActiveRecord::Migration
  def change
    create_table :account_types do |t|
      t.string :title
      t.decimal :rate
      t.decimal :min_deposit

      t.timestamps
    end
  end
end
