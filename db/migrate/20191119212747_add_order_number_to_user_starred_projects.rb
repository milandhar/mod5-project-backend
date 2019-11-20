class AddOrderNumberToUserStarredProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :user_starred_projects, :order_number, :integer
  end
end
