class AddColumnToOrganization < ActiveRecord::Migration[5.2]
  def change
    add_column :organizations, :name, :string
  end
end
