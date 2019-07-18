class CreateProjectCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :project_countries do |t|
      t.integer :project_id
      t.integer :country_id

      t.timestamps
    end
  end
end
