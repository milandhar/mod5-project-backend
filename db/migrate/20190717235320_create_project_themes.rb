class CreateProjectThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :project_themes do |t|
      t.string :theme_str_id
      t.string :name
      t.integer :project_id

      t.timestamps
    end
  end
end
