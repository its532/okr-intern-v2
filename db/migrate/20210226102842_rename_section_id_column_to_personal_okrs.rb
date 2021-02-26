class RenameSectionIdColumnToPersonalOkrs < ActiveRecord::Migration[6.0]
  def change
    rename_column :personal_okrs, :section_id, :section
  end
end
