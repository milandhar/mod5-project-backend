class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.float :funding
      t.float :goal
      t.string :image_url
      t.float :latitude
      t.string :longitude
      t.string :float
      t.text :long_term_impact
      t.text :need
      t.string :organization_id
      t.string :status
      t.string :theme_name
      t.string :title

      t.timestamps
    end
  end
end
