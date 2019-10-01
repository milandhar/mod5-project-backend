class ChangeDonationDescriptions < ActiveRecord::Migration[5.2]
  def change
    rename_column :projects, :DonationDescriptions, :donation_descriptions
  end
end
