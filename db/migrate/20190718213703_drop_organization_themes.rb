class DropOrganizationThemes < ActiveRecord::Migration[5.2]
  def change
    drop_table :organization_themes
  end
end
