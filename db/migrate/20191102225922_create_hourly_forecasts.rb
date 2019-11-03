class CreateHourlyForecasts < ActiveRecord::Migration[6.0]
  def change
    create_table :hourly_forecasts do |t|
      t.integer :time
      t.float :temp
      t.references :forecast, null: false, foreign_key: true
    end
  end
end
