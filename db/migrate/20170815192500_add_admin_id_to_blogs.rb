class AddAdminIdToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :admin_id, :int
  end
end
