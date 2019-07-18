class CreateOrganizationThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_themes do |t|
      t.string :theme_str_id
      t.integer :gg_organization_id

      t.timestamps
    end
  end
end
