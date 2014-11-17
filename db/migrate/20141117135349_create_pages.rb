class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :chapter_id 
      t.integer :comic_id 
      t.string :image_url 

      t.timestamps
    end
  end
end
