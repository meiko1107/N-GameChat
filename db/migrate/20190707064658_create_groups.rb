class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    drop_table :groups
    create_table :groups do |t|
      t.string :name
      t.text :summary
      t.timestamps null: false
    end
  end
end
