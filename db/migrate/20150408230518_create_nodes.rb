class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.integer :user_id
      t.integer :diagram_id
      t.text :description
      t.boolean :start
      t.boolean :end

      t.timestamps null: false
    end
  end
end
