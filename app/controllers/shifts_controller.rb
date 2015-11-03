class ShiftsController < ApplicationController
	include ShiftsHelper

def index
	# paginate(:page => params[:page], :per_page => 5)
	@shifts = Shift.all
	# @shift = Employee.where(id: session[:employee_id]).take
	@new_instance = Shift.new
	if params[:week]
	@container = @new_instance.weeks(params[:week])
	end
	if params[:day]
	@shifts = Shift.find_by_sql(["SELECT * FROM shifts WHERE shift_day = ?", params[:day] ])
	end
end

def show
@employee = current_employee
@shift = @employee.shifts.find(params[:id])
@wants = @shift.coworkers
end

def new
@employee = current_employee
@shift = Shift.new
end

def create
@shift = Shift.new(shift_params)
 if @shift.save!
 	@shift.employee_id = current_employee.id
 	@shift.save
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
		ShiftMailer.shift_notify(@shift, @user).deliver
		redirect_to :back
  end
end

def accept
	if params[:true]
	@employee = Shift.find(params[:id])
	coworker = @employee.coworkers.match
	end
end

# once the flag is made to check for the notification type pass in the shift id and the 
# employee id 

# 	@shift = Shift.find(params[:id])
# 	@employee = current_employee
# 	if Notify.create(notifyable: @shift , employee: current_employee, notify: params[:notify])
# 		ShiftMailer.shift_notify(@shift,@employee).deliver
# 	end
# 	flash[:success] = " Your Coworker has been notified"
# 	redirect_to :back

private 
def shift_params
params.require(:shift).permit(:shift_day,:start,:end,:position)
end
end

