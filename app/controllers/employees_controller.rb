class EmployeesController < ApplicationController
  before_action :employee_details, only: %i[edit update destroy]

  def index
    @employees = Employee.find_in_batches(batch_size: 10).first
  end

  def all_employees
    @employees = Employee.limit(10).order(:id).unscope(:limit)
  end
  
  def show
    @employee = Employee.find_or_initialize_by(id: params[:id])
    redirect_to new_employee_path if @employee.email.blank?
  end

  def new
    @employee = Employee.new
  end

  def edit; end

  def create
    @employee = Employee.find_or_create_by(employee_params)
    unless @employee.id.nil?
      redirect_to @employee
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @employee.destroy

    redirect_to root_path, status: :see_other
  end

  def search
    @employee = Employee.find_by(email: params[:search_email])
    if @employee.nil?
      flash[:alert] = "Enter Valid Email"
      redirect_to all_employees_path
    else
      redirect_to @employee
    end
  end

  def increment
    @employee = Employee.find(params[:id])
    unless @employee.nil?
      @employee.increment!(:no_of_order)
      redirect_to employees_path
    end
  end

  def decrement
    @employee = Employee.find(params[:id])
    unless @employee.nil?
      @employee.decrement!(:no_of_order)
      redirect_to employees_path
    end
  end

  def filtered_employees
    @employees = Employee.all
    case params[:selected_option]
    when ""
      flash[:alert] = "Please Select Option"
    when "1"
      @employees = Employee.where("age > 20").where("age < 40")
      selected_option(1)
    when "2"
      @employees = Employee.where(full_time_available: true)
      selected_option(2)
    when "3"
      @employees = Employee.where("no_of_order = ? AND age > ?", 5, 25)
      selected_option(3)
    when "4"
      @employees = Employee.where("created_at < ?", Date.today)
      selected_option(4)
    when "5"
      @employees = Employee.where("no_of_order = ? OR age < ?", 5, 25)
      selected_option(5)
    when "6"
      @employees = Employee.order(age: :desc)
      selected_option(6)
    when "7"
      @employees = Employee.order(:no_of_order)
      selected_option(7)
    when "8"
      @employees = Employee.where("salary > ?", 45000)
      selected_option(8)
    when "9"
      @employees = []
      Employee.group(:no_of_order).having("no_of_order > 5").count.each do |em|
        Employee.where(no_of_order: em[0]).each do |em|
          @employees.append(em)
        end
      end
      selected_option(9)
    when "10"
      @employees = Employee.where(id: 10, age: 20).limit(20).unscope(:where).only(:limit)
      selected_option(10)
    when "11"
      @employees = Employee.order(:age).reorder(no_of_order: :asc).reverse_order
      selected_option(11)
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:id, :first_name, :last_name, :email, :age, :no_of_order, :full_time_available, :salary)
  end

  def employee_details
    @employee = Employee.find(params[:id])
  end

  def selected_option(n)
    @selected_option = Employee::OPTIONS.to_h.key(n)
  end
end
