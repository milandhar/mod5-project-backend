class RemoveThemeInterest1FromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :theme_interest_1, :string
  end
end
