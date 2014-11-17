class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :name
      t.string :vanity_name
      

      t.timestamps
    end
  end
end
