class Shift < ActiveRecord::Base
	belongs_to :employee
	has_many :notifies, as: :notifyable


end
