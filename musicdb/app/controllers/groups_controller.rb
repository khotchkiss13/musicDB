class GroupsController < ApplicationController
	def index
	end
	def new
	end
	def create
		@group = Group.new(group_params)
		if !@group.valid?
			redirect_to welcome_input_path
			return
		end

		if !@group.save
			redirect_to welcome_input_path
			return
		end
		redirect_to group_path(@group)
	end
	def show
		@group = Group.find(params[:id])
		@members = @group.members
	end
	def edit
	end
	def update
	end
	def destroy
	end

	def group_params
		params.require(:group).permit(:name, :formation_date, :disband_date)
    end
end
