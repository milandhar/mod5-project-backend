class DropProjectCountries < ActiveRecord::Migration[5.2]
  def change
    drop_table :project_countries
  end
end
