class CreatePersonalOkrs < ActiveRecord::Migration[6.0]
  def change
    create_table :personal_okrs do |t|
      t.text :objective
      t.text :objective_reason
      t.string :quarter, null: false, default: ''
      t.references :user
      t.references :section

      t.timestamps
    end
  end
end
