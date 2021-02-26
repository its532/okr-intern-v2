class RemoveSectionForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :section_okrs, :sections
  end
end
