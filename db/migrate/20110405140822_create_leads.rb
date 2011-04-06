class CreateLeads < ActiveRecord::Migration
  def self.up
    create_table :leads do |t|
      t.integer :agent_id
      t.integer :contact_id
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :leads
  end
end
