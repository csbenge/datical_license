class AddBinLicenseToLicense < ActiveRecord::Migration
  def self.up
    add_column :licenses, :binLicense, :binary
  end

  def self.down  
    drop_column :licenses, :binLicense  
  end 
end
