class AddProjectLinkToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :project_link, :string
  end
end
