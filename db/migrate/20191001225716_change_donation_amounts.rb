class ChangeDonationAmounts < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :DonationAmounts, :donation_amounts
  end
end
