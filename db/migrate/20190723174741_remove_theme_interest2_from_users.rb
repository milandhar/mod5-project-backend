class RemoveThemeInterest2FromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :theme_interest_2, :string
  end
end
