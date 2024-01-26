class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.text :first_name, null: false, index: true
      t.text :last_name, null: false, index: true
      t.integer :gender
      t.integer :age
      t.integer :role
      t.text :avatar

      t.timestamps
    end
  end
end
