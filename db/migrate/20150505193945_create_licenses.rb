class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.integer :consumerAmount
      t.string :consumerType
      t.string :issuer
      t.string :subject
      t.string :holder
      t.datetime :notAfter
      t.string :info
      t.string :companyName
      t.string :contactName
      t.string :contactEmail
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
