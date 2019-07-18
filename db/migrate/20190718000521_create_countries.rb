class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :project_count
      t.string :iso3166CountryCode

      t.timestamps
    end
  end
end
