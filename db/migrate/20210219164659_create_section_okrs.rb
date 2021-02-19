class CreateSectionOkrs < ActiveRecord::Migration[6.0]
  def change
    create_table :section_okrs do |t|
      t.text :objective
      t.string :quarter, null: false, default: ''

      t.timestamps
    end
  end
end
