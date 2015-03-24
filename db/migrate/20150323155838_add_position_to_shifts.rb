class AddPositionToShifts < ActiveRecord::Migration
  def change
  	add_column :shifts, :position, :string
  end
end
