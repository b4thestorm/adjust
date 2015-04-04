class Account < ActiveRecord::Base
	belongs_to :owner, class_name: 'Employee', foreign_key: 'owner_id'
	accepts_nested_attributes_for :owner
end
