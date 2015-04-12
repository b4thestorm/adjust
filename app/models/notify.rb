class Notify < ActiveRecord::Base
belongs_to :employee
belongs_to :notifyable, polymorphic: true

default_scope { where(account_id: Account.current_id )}
end
