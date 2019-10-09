class DropProjectDonationOptions < ActiveRecord::Migration[5.2]
  def change
    drop_table :project_donation_options
  end
end
