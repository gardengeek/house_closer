class AddActiveToLeads < ActiveRecord::Migration
  def self.up
    add_column :leads, :active, :boolean, :default => true
  end

  def self.down
    remove_column :leads, :active
  end
end
