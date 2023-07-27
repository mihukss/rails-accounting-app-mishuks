class EmployeesController < ApplicationController
  def show
    @employees = Employee.all
  end
  
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def update
    @employees = Employee.find_by(params[:id])
    @employees.update!(permitted_params)
  end

  def create
    Employee.create!(employee_params.merge(user_attributes: user_params))
  end

  def destroy
  end
  
  def permitted_params
    params.require(:employee).permit(:first_name, :last_name, :date_of_birth)
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :date_of_birth)
  end

  def user_params
    params[:employee].require(:user).permit(:email, :password)
  end
end
