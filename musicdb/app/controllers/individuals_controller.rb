class IndividualsController < ApplicationController
	def index
	end
	def new
	end
	def create
		@individual = Individual.new(individual_params)
		if !@individual.valid?
			redirect_to welcome_input_path
			return
		end

		if !@individual.save
			redirect_to welcome_input_path
			return
		end
		redirect_to individual_path(@individual)
	end
	def show
		@individual = Individual.find(params[:id])
		@members = @individual.members
		@writer = Individual.find(params[:id])
		@producer = Individual.find(params[:id])
	end
	def edit
	end
	def update
	end
	def destroy
	end

	def individual_params
		params.require(:individual).permit(:name, :birth_date, :primary_instrument, :secondary_instrument, :vocals)
	end
end
