class CreateUserteams < ActiveRecord::Migration[5.2]
  def change
    drop_table :user_teams
    create_table :user_teams do |t|
      t.integer :user_id
      t.integer :team_id
      t.timestamps null: false
    end
  end
end
