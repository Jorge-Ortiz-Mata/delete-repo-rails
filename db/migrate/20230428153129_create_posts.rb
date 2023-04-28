class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description
      t.integer :year

      t.timestamps
    end
  end
end
