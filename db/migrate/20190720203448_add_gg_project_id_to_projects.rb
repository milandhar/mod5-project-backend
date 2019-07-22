class AddGgProjectIdToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :gg_project_id, :integer
  end
end
