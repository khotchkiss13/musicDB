class ReleasesController < ApplicationController
	def index
	end
	def new
	end
	def create
		@release = Release.new(release_params)
		if !@release.valid?
			redirect_to welcome_input_path
			return
		end

		if !@release.save
			redirect_to welcome_input_path
			return
		end
		redirect_to release_path(@release)
	end
	def show
		@release = Release.find(params[:id])
		@tracks = @release.tracks
	end
	def edit
	end
	def update
	end
	def destroy
	end

	def release_params
		params.require(:release).permit(:name, :date, :media_type, :total_length, :copies_sold, :total_profit, :medium, :certification)
	end
end
