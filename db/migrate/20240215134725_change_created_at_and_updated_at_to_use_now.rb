class ChangeCreatedAtAndUpdatedAtToUseNow < ActiveRecord::Migration[7.1]
  def change
    change_column_default :countries, :created_at, -> { 'CURRENT_TIMESTAMP' }
    change_column_default :countries, :updated_at, -> { 'CURRENT_TIMESTAMP' }
  end
end
