class CreateDailyForecasts < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_forecasts do |t|
      t.integer :day
      t.string :summary
      t.string :icon
      t.float :precip_pct
      t.float :high
      t.float :low
      t.references :forecast, null: false, foreign_key: true
    end
  end
end
