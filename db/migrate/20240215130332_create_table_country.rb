class CreateTableCountry < ActiveRecord::Migration[7.1]
  def change
    create_table :countries, id: false do |t|
      t.string :country_code, null: false, primary_key: true
      t.string :country_name
      t.string :country_flag
      
      t.timestamps
    end
  end
end
