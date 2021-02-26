class RenameSectionIdToSectionOkr < ActiveRecord::Migration[6.0]
  def change
    rename_column :section_okrs, :section_id, :section
  end
end
