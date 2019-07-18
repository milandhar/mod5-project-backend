class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :theme_interest_1, :default => ''
      t.string :theme_interest_2, :default => ''
      t.string :theme_interest_3, :default => ''

      t.timestamps
    end
  end
end
