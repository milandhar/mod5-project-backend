class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.float :funding
      t.float :goal
      t.string :image_url
      t.float :latitude
      t.float :longitude
      t.text :long_term_impact
      t.text :need
      t.integer :gg_organization_id
      t.string :status
      t.string :summary
      t.string :theme_str_id
      t.string :title

      t.timestamps
    end
  end
end
