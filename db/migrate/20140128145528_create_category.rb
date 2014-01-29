class CreateCategory < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
    end

    create_table :posts do |t|
      t.string :title
      t.integer :category_id
      t.text :description
      t.string :price
      t.string :email
      t.string :key
    end
  end
end
