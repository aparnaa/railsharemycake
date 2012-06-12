class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :contact_name
      t.string :email
      t.string :phone_no

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
