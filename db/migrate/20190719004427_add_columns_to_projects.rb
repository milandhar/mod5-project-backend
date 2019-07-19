class AddColumnsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :country_id, :integer
    add_column :projects, :organization_id, :integer
    add_column :projects, :theme_id, :integer
  end
end
