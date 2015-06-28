class Account < ActiveRecord::Base
	has_many :employees
	belongs_to :owner, class_name: 'Employee', foreign_key: 'owner_id'
	accepts_nested_attributes_for :owner
  cattr_accessor :current_id

end
