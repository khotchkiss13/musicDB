class RecordLabelsController < ApplicationController
	def index
	end
	def new
	end
	def create
		@record_label = RecordLabel.new(record_label_params)
		if !@record_label.valid?
			redirect_to input_data_path
			return
		end

		if !@record_label.save
			redirect_to input_data_path
			return
		end
		redirect_to record_label_path(@record_label)
	end
	def show
		@record_label = RecordLabel.find(params[:id])
	end
	def edit
	end
	def update
	end
	def destroy
	end

	def record_label_params
		params.require(:record_label).permit(:name, :founder, :location, :ceo, :date_founded, :date_dissolved)
	end
end
