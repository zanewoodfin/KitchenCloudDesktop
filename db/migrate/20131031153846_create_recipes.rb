class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :servings
      t.integer :cook_time
      t.integer :calories

      t.timestamps
    end
  end
end
