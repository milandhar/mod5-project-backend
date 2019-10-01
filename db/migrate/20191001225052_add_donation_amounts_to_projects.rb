class AddDonationAmountsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :DonationAmounts, :integer, array: true, default: []
  end
end
