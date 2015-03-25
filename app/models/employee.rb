class Employee < ActiveRecord::Base
	has_many :shifts
	has_many :notifies
	# has_many :employee_shifts
	# has_many :friends, through: :employee_shifts 
    has_secure_password validations: false

	validates :username, presence: true
	validates :password, presence: true, on: :create


	def full_name 
		f_name + " " + l_name
	end	
end
