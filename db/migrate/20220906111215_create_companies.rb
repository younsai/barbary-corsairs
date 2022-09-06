class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :address
      t.string :phone_number
      t.string :logo
      t.references :user

      t.timestamps
    end
  end
end
