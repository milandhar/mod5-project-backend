class AddColumnsToOrganization < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :country_id, :integer
    add_column :organizations, :theme_id, :integer
  end
end
