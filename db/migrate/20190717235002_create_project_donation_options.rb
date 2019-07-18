class CreateProjectDonationOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :project_donation_options do |t|
      t.integer :project_id
      t.integer :amount
      t.text :description

      t.timestamps
    end
  end
end
