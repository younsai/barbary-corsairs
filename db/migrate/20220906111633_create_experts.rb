class CreateExperts < ActiveRecord::Migration[7.0]
  def change
    create_table :experts do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :github_account
      t.string :twitter
      t.string :cv
      t.string :website_portfolio
      t.text :bio
      t.string :idendity_number
      t.string :idendity_photo
      t.references :user

      t.timestamps
    end

  end
end
