class AddAccountIdToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :account_id, :integer
  end
end
