class CreateDiagrams < ActiveRecord::Migration
  def change
    create_table :diagrams do |t|
      t.text :title
      t.text :description

      t.timestamps null: false
    end
  end
end
