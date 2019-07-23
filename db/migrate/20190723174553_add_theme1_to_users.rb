class AddTheme1ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :theme1, :integer
  end
end
