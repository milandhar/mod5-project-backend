class AddDonationDescriptionsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :DonationDescriptions, :text, array: true, default: []
  end
end
