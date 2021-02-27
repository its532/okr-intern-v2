class AddColumnUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :hire_date, :datetime
  end
end
