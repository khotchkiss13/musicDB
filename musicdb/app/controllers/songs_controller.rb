class SongsController < ApplicationController
	def index
	end
	def new
	end
	def create
		@song = Song.new(song_params)
		if !@song.valid?
			redirect_to welcome_input_path
			return
		end

		if !@song.save
			redirect_to welcome_input_path
			return
		end
		redirect_to song_path(@song)
	end
	def show
		@song = Song.find(params[:id])
	end
	def edit
	end
	def update
	end
	def destroy
	end
	def song_params
		params.require(:song).permit(:name, :genre, :length, :bpm, :medium)
	end
end
