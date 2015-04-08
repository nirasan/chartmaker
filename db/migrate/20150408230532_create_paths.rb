class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.integer :user_id
      t.integer :diagram_id
      t.integer :node_id
      t.text :description
      t.integer :next_node_id

      t.timestamps null: false
    end
  end
end
