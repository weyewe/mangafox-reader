class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.integer :comic_id 
      t.string :chapter 
      t.string :volume 
      t.string :initial_link 
      
      t.boolean :is_parsed, :default => false 

      t.timestamps
    end
  end
end
