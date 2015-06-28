class ShiftsController < ApplicationController

def index
	# paginate(:page => params[:page], :per_page => 5)
	@shifts = Shift.all
	@shift = session[:employee_id]
	@week_ranges = Shift.weeks_ranges

	# if params[:week] == '1'
	# 	@week = Shift.weeks(params[:week])
	# elsif params[:week] == '2'
	# 	@week = Shift.weeks(params[:week])
	# elsif params[:week] == '3'
	# 	@week = Shift.weeks(params[:week])
	# elsif params[:week] == '4'
	# 	@week = Shift.weeks(params[:week]) 
	# else  
		today = Date.today 
		@days_from_this_week = (today.at_beginning_of_week..today.at_end_of_week).map
		@week = @days_from_this_week.to_a
	

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
	@shift = Shift.find(params[:id])
	@employee = current_employee
	if Notify.create(notifyable: @shift , employee: current_employee, notify: params[:notify])
		ShiftMailer.shift_notify(@shift,@employee).deliver
	end
	flash[:success] = " Your Coworker has been notified"
	redirect_to :back
end

def accept
	#find the shift employee in question
	#find the employee who wanted it 
	@shift = Notify.where(notifyable_id:  )
	@employee = Notify.find(employee_id: current_employee)

	if params[:true]
		ShiftMailer.shift_accept(@shift,@employee).deliver
	elsif 
		ShiftMailer.shift_reject(@shift,@employee).deliver
	end

end
# def accept_or_reject
# 	just like notify but it notifies the other person who requested the shift
  
#   if params[:true]
	
#   elsif params[:false]
  
# 	end

# end



private 
def shift_params
params.require(:shift).permit(:shift_day,:start,:end,:position,:employee_id)
end
end

