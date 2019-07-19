class RemoveColumnsFromOrganizations < ActiveRecord::Migration[5.2]
  def change
    remove_column :organizations, :country_id, :integer
    remove_column :organizations, :theme_id, :integer
  end
end
