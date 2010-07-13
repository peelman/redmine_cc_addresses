class CreateCcAddresses < ActiveRecord::Migration
  def self.up
    create_table :cc_addresses do |t|
      t.string :mail
      t.integer :issue_id
    end
  end

  def self.down
    drop_table :cc_addresses
  end
end
