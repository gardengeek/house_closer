class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :home_phone
      t.string :cell_phone
      t.string :work_phone
      t.string :email
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :postal_code
      t.integer :state_id

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
