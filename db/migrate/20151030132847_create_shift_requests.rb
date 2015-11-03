class CreateShiftRequests < ActiveRecord::Migration
  def change
    create_table :shift_requests do |t|

      t.timestamps
    end
  end
end
