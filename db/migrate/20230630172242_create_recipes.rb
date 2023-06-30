class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.integer :cook_time
      t.references :recipe_type, null: false, foreign_key: true
      t.string :ingredients
      t.text :instructions

      t.timestamps
    end
  end
end
