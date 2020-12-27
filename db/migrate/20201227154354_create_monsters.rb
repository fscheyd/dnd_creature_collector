class CreateMonsters < ActiveRecord::Migration
  def change
    create_table :monsters do |t| 
    t.string :name
    t.string :type
    t.string :weakness
    t.integer :cr
    t.integer :user_id
    end
  end
end
