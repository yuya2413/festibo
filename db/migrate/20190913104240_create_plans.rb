class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.references :room_type, foreign_key: true
      t.integer :charge
      t.date :start_date

      t.timestamps
    end
  end
end
