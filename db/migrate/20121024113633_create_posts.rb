class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.references :post_category

      t.timestamps
    end
    add_index :posts, :post_category_id
  end
end
