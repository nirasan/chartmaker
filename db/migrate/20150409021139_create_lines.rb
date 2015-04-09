class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :user_id
      t.integer :diagram_id
      t.integer :node_id
      t.integer :next_node_id
      t.text :description

      t.timestamps null: false
    end
  end
end
