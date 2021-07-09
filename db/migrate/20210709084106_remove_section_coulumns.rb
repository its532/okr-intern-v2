class RemoveSectionCoulumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :personal_okrs, :section
    remove_column :section_okrs, :section
  end
end
