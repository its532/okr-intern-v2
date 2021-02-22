class CreateKeyResultComments < ActiveRecord::Migration[6.0]
  def change
    create_table :key_result_comments do |t|
      t.text :comment
      t.string :month, null: false
      t.text :measure
      t.references :key_result

      t.timestamps
    end
  end
end
