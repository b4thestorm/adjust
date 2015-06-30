class EmployeeShift < ActiveRecord::Base
belongs_to :shift
belongs_to :coworkers, class_name: 'Employee', foreign_key: 'coworker_id'
end
