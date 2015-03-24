class EmployeeShiftsController < ApplicationController
	def new
		if params[:friend_id]
			@coworker = Employee.find(params[:friend_id])
			@employee_shift = current_user.employee_shifts.new(friend: @coworker)
		else
			flash[:error] = "No relation"
		end
	end
rescue ActiveRecord::RecordNotFound
	render file: 'public/404', status: :not_found
end
