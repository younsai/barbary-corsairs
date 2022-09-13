class CreatePrograms < ActiveRecord::Migration[7.0]
  def change
    create_table :programs do |t|
      t.string :title
      t.text :terms
      t.references :company
      t.references :report_perimeter

      t.timestamps
    end
    add_column :programs, :accepted_vulnerabilities, :text
    add_column :programs, :excluded_vulnerabilities, :text
    add_column :programs, :vulnerability_levels, :text
    add_column :programs, :bounty_range, :string
  end
end

