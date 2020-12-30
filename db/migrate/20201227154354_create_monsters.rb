class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t| 
    t.string :name
    t.string :monster_type
    t.string :weakness
    t.integer :cr
    t.integer :user_id
    
    t.timestamps null: false
    end
  end
end
