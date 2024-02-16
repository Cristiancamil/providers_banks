class CreateBanks < ActiveRecord::Migration[7.1]
  def change
    create_table :banks do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :email
      t.string :web_site
      t.string :provider_nit
      t.string :country_code
      t.string :department_code
      t.string :city_code
      t.string :type_account
      t.string :aditional_information

      t.timestamps
    end
    add_foreign_key :banks, :countries, column: :country_code, primary_key: :country_code
    add_foreign_key :banks, :departments, column: :department_code, primary_key: :department_code
    add_foreign_key :banks, :cities, column: :city_code, primary_key: :city_code
  end
end
