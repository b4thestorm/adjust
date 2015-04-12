class Shift < ActiveRecord::Base
	belongs_to :employee
	has_many :notifies, as: :notifyable

  default_scope { where(account_id: Account.current_id )}

end
