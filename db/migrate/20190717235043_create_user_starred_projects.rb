class CreateUserStarredProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :user_starred_projects do |t|
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
