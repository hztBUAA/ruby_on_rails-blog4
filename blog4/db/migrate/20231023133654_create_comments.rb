class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :blog, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end

    create_table :blogs_comments do |t|

      t.integer :blog_id
      t.integer :comment_id
      t.timestamps
    end
  end
end
