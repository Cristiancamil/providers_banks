class CreateProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :providers, id: false do |t|
      t.string :name
      t.string :nit, null: false, primary_key: true
      t.string :name_contact
      t.string :phone_contact
      t.string :account_number

      t.timestamps
    end
  end
end
