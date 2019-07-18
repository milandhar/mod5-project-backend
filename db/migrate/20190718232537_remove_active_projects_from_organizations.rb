class RemoveActiveProjectsFromOrganizations < ActiveRecord::Migration[5.2]
  def change
    remove_column :organizations, :active_projects, :string
  end
end
