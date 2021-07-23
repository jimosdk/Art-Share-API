class CreateCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :collections do |t|
      t.integer :owner_id,null: false  
      t.string :title,null: false 
    end
    add_index :collections,:owner_id
  end
end
