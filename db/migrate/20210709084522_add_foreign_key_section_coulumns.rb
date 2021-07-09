class AddForeignKeySectionCoulumns < ActiveRecord::Migration[6.0]
  def change
    add_reference :personal_okrs, :section, foreign_key: true
    add_reference :section_okrs, :section, foreign_key: true
  end
end
