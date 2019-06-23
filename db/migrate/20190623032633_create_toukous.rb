class CreateToukous < ActiveRecord::Migration[5.2]
  def change
    create_table :toukous do |t|
      t.string :name
      t.string :body
      t.timestamps null: false
      t.integer :user_id
    end
  end
end
