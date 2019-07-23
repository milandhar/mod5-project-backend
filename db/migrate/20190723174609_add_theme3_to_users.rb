class AddTheme3ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :theme3, :integer
  end
end
