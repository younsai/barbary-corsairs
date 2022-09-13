class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.text :summary
      t.string :status, default: 'waiting'
      t.text :details
      t.references :program, null: false, foreign_key: true
      t.references :expert, null: false, foreign_key: true

      t.timestamps
    end
  end
end
