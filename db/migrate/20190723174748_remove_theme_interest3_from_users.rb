class RemoveThemeInterest3FromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :theme_interest_3, :string
  end
end
