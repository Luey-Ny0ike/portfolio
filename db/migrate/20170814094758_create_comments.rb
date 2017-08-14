class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :comment
      t.column :blog_id, :int
      t.column :user_id, :int

      t.timestamps
    end
  end
end
