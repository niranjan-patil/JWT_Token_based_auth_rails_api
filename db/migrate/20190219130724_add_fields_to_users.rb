class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :contact_no, :integer
  	add_column :users, :points, :double
  	add_column :users, :otp, :integer
  end
end
