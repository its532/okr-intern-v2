class RenameColumnToKeyResults < ActiveRecord::Migration[6.0]
  def change
    rename_column :key_results, :key_result, :title
    rename_column :key_results, :key_result_point, :point
  end
end
