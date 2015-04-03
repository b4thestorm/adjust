class Account < ActiveRecord::Base
	belongs_to :employee, class_name: 'Employee', foreign_key: 'employee_id'
	accepts_nested_attributes_for :owner
end
