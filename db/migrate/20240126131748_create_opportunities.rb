class CreateOpportunities < ActiveRecord::Migration[7.1]
  def change
    create_table :opportunities do |t|
      t.text :procedure_name, index: true
      t.references :patient, foreign_key: { to_table: :members }
      t.references :doctor, foreign_key: { to_table: :members }
      t.jsonb :stage_history
      t.timestamps
    end
  end
end
