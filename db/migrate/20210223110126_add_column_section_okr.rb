class AddColumnSectionOkr < ActiveRecord::Migration[6.0]
  def change
    add_column :section_okrs, :published_at, :datetime
  end
end
