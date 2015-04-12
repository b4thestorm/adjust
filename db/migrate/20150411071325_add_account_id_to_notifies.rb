class AddAccountIdToNotifies < ActiveRecord::Migration
  def change
    add_column :notifies, :account_id, :integer
  end
end
