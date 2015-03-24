class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :month
      t.integer :day
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
