class Employee < ActiveRecord::Base
	belongs_to :account
  belongs_to :department
	has_many :shifts
	has_many :notifies
  has_many :employee_shifts
  has_many :shifts, through: :employee_shifts


  has_secure_password validations: false
	validates :username, presence: true, uniqueness: true
	validates :password, presence: true, on: :create
	validates :email, :email_format => {message: 'needs valid email format'}
  validate :authcode_matches

   def authcode_matches
   	unless self.authcode == 'c3p2ze'
   		errors.add(:authcode, "Incorrect authorization code")
   	end
   end 

   def set_flag(type) 
    self.flag = type
    self.save
   end 

   def set_alert(type)
    self.alert = type
    self.save
    end 
  
	# default_scope { where(account_id: Account.current_id )}
	 

	 def full_name 
	 	f_name + " " + l_name
	 end

 


	# def self.scoped_to(account)
	# 	where(:account_id => account.id)
	# end	
end
