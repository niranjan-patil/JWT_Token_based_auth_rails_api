class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :res_name
      t.string :poc_email
      t.string :password_digest
      t.integer :poc_contact_no
      t.string :poc_name
      t.integer :otp
      t.timestamps
    end
  end
end
