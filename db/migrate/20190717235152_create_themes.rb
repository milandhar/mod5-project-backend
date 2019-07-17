class CreateThemes < ActiveRecord::Migration[5.2]
  def change
    create_table :themes do |t|
      t.string :theme_str_id
      t.string :name

      t.timestamps
    end
  end
end
