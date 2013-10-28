class AddDefaultValueToNoofbooksissued < ActiveRecord::Migration
  def self.up
	change_column :details, :noofbooksissued, :integer, :default => 0
  end
  def self.down
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
