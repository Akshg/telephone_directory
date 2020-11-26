class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :first_name, null: false
      t.string :middle_name
      t.string :last_name, null: false
      t.string :email
      t.string :mobile
      t.string :landline
      t.text :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
