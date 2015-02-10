class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :gender
      t.string :identity
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
