class SongsController < ApplicationController
	def index
	end
	def new
	end
	def create
		@song = Song.new(song_params)
		if !@song.valid?
			redirect_to input_data_path
			return
		end

		writers = param[:writers]
		writers.each do |writer|
			individual = Individual.where(name: writer).first
			if individual.nil?
				redirect_to input_data_path
			end
			@song.writers.create(individual_id: individual.id)
		end
		producers = param[:producers]
		producers.each do |producer|
			individual = Individual.where(name: producer).first
			if individual.nil?
				redirect_to input_data_path
			end
			@song.producers.create(individual_id: individual.id)
		end

		if !@song.save
			redirect_to input_data_path
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
