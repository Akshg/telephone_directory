class CreateMetric < ActiveRecord::Migration[6.0]
  def change
    create_table :metrics do |t|
      t.references :contact, null: false, foreign_key: true
      t.integer :views_count
      t.date :date

      t.timestamps
    end
  end
end
