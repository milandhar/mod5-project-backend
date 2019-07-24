class AddTheme2ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :theme2, :integer
  end
end
