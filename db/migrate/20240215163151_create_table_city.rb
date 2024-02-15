class CreateTableCity < ActiveRecord::Migration[7.1]
  def change
    create_table :cities, id: false do |t|
      t.string :city_code, null: false, primary_key: true
      t.string :city_name
      t.string :department_code

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }, null: false
    end
    add_foreign_key :cities, :departments, column: :department_code, primary_key: :department_code
  end
end
