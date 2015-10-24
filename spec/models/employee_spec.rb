require 'rails_helper'

RSpec.describe Employee, type: :model do

describe 'Employee' do

  it 'should have a password' do 
    @employee = Employee.new(f_name: 'Joe', l_name: 'Frazier', password: '')
    expect(@employee).to_not be_valid
  end

  it 'should return a full_name' do 
    employee = Employee.new(f_name: 'Joe', l_name: 'Frazier', password: 'pinballs', email: 'arnoldsanchez@gmail.com')
    @employee = employee.full_name
    expect(@employee).to match('Joe Frazier')
  end

end 
end
