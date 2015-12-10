class ShowsController < ApplicationController
	def index
	end
	def new
	end
	def create
		@show = Show.new(show_params)
		if !@show.valid?
			redirect_to input_data_path
			return
		end

		if !@show.save
			redirect_to input_data_path
			return
		end
		redirect_to show_path(@show)
	end
	def show
		@show = Show.find(params[:id])
	end
	def edit
	end
	def update
	end
	def destroy
	end

	def show_params
		params.require(:show).permit(:name, :venue, :date, :tickets_sold, :total_profit)
	end
end
