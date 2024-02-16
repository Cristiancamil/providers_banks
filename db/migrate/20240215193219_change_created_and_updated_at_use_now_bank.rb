class ChangeCreatedAndUpdatedAtUseNowBank < ActiveRecord::Migration[7.1]
  def change
    change_column_default :banks, :created_at, -> { 'CURRENT_TIMESTAMP' }
    change_column_default :banks, :updated_at, -> { 'CURRENT_TIMESTAMP' }
  end
end
