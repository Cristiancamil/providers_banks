class AddColumnsToProvider < ActiveRecord::Migration[7.1]
  def change
    add_column :providers, :country_code, :string
    add_column :providers, :department_code, :string
    add_column :providers, :city_code, :string
    add_column :providers, :address, :string

    add_foreign_key :providers, :countries, column: :country_code, primary_key: :country_code
    add_foreign_key :providers, :departments, column: :department_code, primary_key: :department_code
    add_foreign_key :providers, :cities, column: :city_code, primary_key: :city_code
  end
end
