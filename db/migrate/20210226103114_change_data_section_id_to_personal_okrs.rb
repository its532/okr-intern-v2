class ChangeDataSectionIdToPersonalOkrs < ActiveRecord::Migration[6.0]
  def change
    change_column :personal_okrs, :section, :string
  end
end
