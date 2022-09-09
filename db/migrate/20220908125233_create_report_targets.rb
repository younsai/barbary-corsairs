class CreateReportTargets < ActiveRecord::Migration[7.0]
  def change
    create_table :report_targets do |t|
      t.string :link
      # t.references :report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
