class AddCommentIdToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :comment_id, :int
  end
end
