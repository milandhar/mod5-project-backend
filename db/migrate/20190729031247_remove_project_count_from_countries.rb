class RemoveProjectCountFromCountries < ActiveRecord::Migration[5.2]
  def change
    remove_column :countries, :project_count, :integer
  end
end
