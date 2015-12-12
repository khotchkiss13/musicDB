class TracksController < ApplicationController
	def index
	end
	def new
	end
	def create
	end
	def show
		@track = Track.find(params[:id])
	end
	def edit
	end
	def update
	end
	def destroy
	end
end
