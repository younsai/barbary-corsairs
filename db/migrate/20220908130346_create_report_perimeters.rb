class CreateReportPerimeters < ActiveRecord::Migration[7.0]
  def change
    create_table :report_perimeters do |t|
      t.string :link

      t.timestamps
    end
  end
end
