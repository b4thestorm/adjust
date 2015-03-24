class SessionsController < ApplicationController

def new

end

def create
	employee = Employee.where(username: params[:username]).first
	if employee && employee.authenticate(params[:password])
		session[:employee_id] = employee.id
		flash[:notice] = "Successfully logged in!"
		redirect_to root_path
	else
		flash[:notice] = "There is something wrong with your username and/or password"
		redirect_to login_path
	end
end

def destroy
	session[:employee_id] = nil 
	flash[:notice] = "You've Logged Out"
	redirect_to root_path
end

end