class CreateOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :organizations do |t|
      t.integer :Gg_organization_id
      t.integer :active_projects
      t.string :city
      t.string :country
      t.text :mission
      t.string :url

      t.timestamps
    end
  end
end
