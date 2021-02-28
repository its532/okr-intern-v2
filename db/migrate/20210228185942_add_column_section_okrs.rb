class AddColumnSectionOkrs < ActiveRecord::Migration[6.0]
  def change
    add_column :section_okrs, :weight, :integer, default: 0, null: false
  end
end
