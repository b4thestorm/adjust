class ShiftsController < ApplicationController
	include ShiftsHelper

def index
	# paginate(:page => params[:page], :per_page => 5)
	@shifts = Shift.all
	@shift = session[:employee_id]
	@new_instance = Shift.new
	if params[:week]
	container = @new_instance.weeks(params[:week])
	binding.pry
	@container = index_for_options(container)
	end
		# today = Date.today 
		# @days_from_this_week = (today.at_beginning_of_week..today.at_end_of_week).map
		# @week = @days_from_this_week.to_a
end

def show
@employee = current_employee
@shift = @employee.shifts.find(params[:id])
end

def new
@employee = current_employee
@shift = @employee.shifts.new
end

def create
@shift = current_employee.shifts.new(shift_params)
 if @shift.save
	flash[:success] = "New shift was added"
	redirect_to employee_shifts_path
  else
	flash[:danger] = "Shift was not added"
	render 'new'
 end
end

def destroy
	@employee = current_employee
	@shift = @employee.shifts.find(params[:id])
	@shift.destroy
	redirect_to employee_shifts_path
end

def notify
	@user = current_employee
	@shift = Shift.find(params[:id])
	if @shift.coworkers <<  @user
		flash[:success] = 'Your Request has been sent'
		ShiftMailer.shift_notify(@shift,@user).deliver
		redirect_to :back
  end
end

def accept
	if params[:true]
	@employee = Shift.find(params[:id])
	coworker = @employee.coworkers.match
	end
end
# 	@shift = Shift.find(params[:id])
# 	@employee = current_employee
# 	if Notify.create(notifyable: @shift , employee: current_employee, notify: params[:notify])
# 		ShiftMailer.shift_notify(@shift,@employee).deliver
# 	end
# 	flash[:success] = " Your Coworker has been notified"
# 	redirect_to :back



private 
def shift_params
params.require(:shift).permit(:shift_day,:start,:end,:position,:employee_id)
end
end

