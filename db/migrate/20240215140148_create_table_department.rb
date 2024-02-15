class CreateTableDepartment < ActiveRecord::Migration[7.1]
  def change
    create_table :departments, id: false do |t|
      t.string :department_code, null: false, primary_key: true
      t.string :department_name
      t.string :country_code
      
      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }, null: false
    end
    add_foreign_key :departments, :countries, column: :country_code, primary_key: :country_code
  end
end
