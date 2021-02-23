class AddColumnSectionOkr < ActiveRecord::Migration[6.0]
  def change
    add_column :section_okrs, :year, :string
  end
end
