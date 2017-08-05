class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.column :name, :varchar
      t.column :description, :varchar
      t.column :link, :varchar
      t.column :image, :varchar
      t.column :skill_id, :int
    end
  end
end
