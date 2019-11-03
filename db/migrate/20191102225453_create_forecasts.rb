class CreateForecasts < ActiveRecord::Migration[6.0]
  def change
    create_table :forecasts do |t|
      t.string :current_summary
      t.integer :current_time
      t.string :daily_summary
      t.float :high
      t.float :low
      t.string :icon
      t.float :temp
      t.float :feels_like
      t.float :humidity
      t.float :visibility
      t.string :uv_index

      t.timestamps
    end
  end
end
