class CreateSectionOkrVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :section_okr_votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :section_okr, null: false, foreign_key: true
      t.string :quarter, null: false, default: ''
      t.string :year, null: false, default: ''
      t.text :comment

      t.timestamps
    end
  end
end
