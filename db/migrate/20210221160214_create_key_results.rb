class CreateKeyResults < ActiveRecord::Migration[6.0]
  def change
    create_table :key_results do |t|
      t.text :key_result
      t.float :key_result_point
      t.references :okr, polymorphic: true, index: true

      t.timestamps
    end
  end
end
