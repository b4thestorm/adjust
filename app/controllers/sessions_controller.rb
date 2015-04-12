class SessionsController < ApplicationController
	

def new

end
def create
	employee = Employee.find_by(username: params[:username])
	if employee && employee.authenticate(params[:password])
		session[:employee_id] = employee.id
		flash[:notice] = "Successfully logged in!"
		redirect_to bulletin_url(:host => request.subdomain + '.' + request.domain + '.' + request.port_string)
	else
		flash[:notice] = "There is something wrong with your username and/or password"
		redirect_to login_url(:host => request.subdomain + '.' + request.domain + '.' + request.port_string)
	end
end

def destroy
	session[:employee_id] = nil 
	flash[:notice] = "You've Logged Out"
	redirect_to sign_up_path
end
end
