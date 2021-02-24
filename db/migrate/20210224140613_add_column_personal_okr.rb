class AddColumnPersonalOkr < ActiveRecord::Migration[6.0]
  def change
    add_column :personal_okrs, :year, :string
  end
end
