class DropProjectThemes < ActiveRecord::Migration[5.2]
  def change
    drop_table :project_themes
  end
end
