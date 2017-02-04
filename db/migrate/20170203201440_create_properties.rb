class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.integer :value_cents, limit: 8
      t.references :owner, foreign_key: true, index: true

      t.timestamps
    end
  end
end
