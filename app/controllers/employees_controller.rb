class EmployeesController < ApplicationController
    before_action :find_employee,  only: [:show, :edit, :update, :destroy]
    def index 
        @employees = Employee.all
    end

    def show
    end

    def new
        @employee = Employee.new
    end

    def create
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to @employee
        else 
            flash[:errors] = @employee.errors.full_messages
            render'new'
        end
    end

    def edit
    end

    def update
        if @employee.update(employee_params)
        redirect_to @employee
        else
        flash[:errors] = @employee.errors.full_messages
        render :edit
        end
    end

	def destroy
		@employee.destroy
		redirect_to employee_path
	end

        private 
        def find_employee
            @employee = Employee.find(params[:id])

        end

        def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
        end

end
