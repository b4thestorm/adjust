class SessionsController < ApplicationController


def new

end

def create
	employee = Employee.find_by(username: params[:username])
	if employee && employee.authenticate(params[:password])
		session[:employee_id] = employee.id
		flash[:success] = "Welcome to Adjust - (Search and add your shifts)"
		redirect_to bulletin_url
	else
		flash.now[:danger] = "There is something wrong with your username and/or password"
		redirect_to login_url
	end
end

def destroy
	session[:employee_id] = nil 
	flash[:danger] = "You've Logged Out"
	redirect_to sign_up_url
end
end
