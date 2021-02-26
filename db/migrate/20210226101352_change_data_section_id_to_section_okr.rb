class ChangeDataSectionIdToSectionOkr < ActiveRecord::Migration[6.0]
  def change
    change_column :section_okrs, :section, :string
  end
end
