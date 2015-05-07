class AddJsonLicenseToLicense < ActiveRecord::Migration
  def change
    add_column :licenses, :jsonLicense, :text
  end
end
