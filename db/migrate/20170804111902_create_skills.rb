class CreateSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :skills do |t|
      t.column :name, :varchar
      t.column :description, :varchar
    end
  end
end
