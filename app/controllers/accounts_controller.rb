class AccountsController < ApplicationController

	def new
		@account = Account.new
		@account.build_owner
	end

	def create 
		@account = Account.create(account_params)
		flash[:success] = 'Your account has been successfully created.'
		redirect_to root_url
	end

	private
	
	def account_params
		params.require(:account).permit(:name,owner_attributes: [:email, :password, :f_name, :l_name, :username ])
	end

# 	Shifts.where(user_id: current_user.id)

# 	user has contact has phophes


# 	current_user.contact.phones

# 	SELECT Phones inner join ... contact inner joins users where user_id = 2

# <company name>.my_app.com


# my_app.cpm/<company
#  name>/

# 	current_user.account
end
