class AddActivitiesToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :activities, :text
  end
end
