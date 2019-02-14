class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :rest_name
      t.integer :poc_contact_no
      t.string :poc_email
      t.string :poc_name
      t.string :encrypted_password
      t.integer :otp
      t.timestamps
    end
  end
end
