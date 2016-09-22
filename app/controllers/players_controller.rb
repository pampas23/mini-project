class PlayersController < ApplicationController

	def index
		@players=Player.all
	end

	def new
		@player = Player.new
	end

	def create
		@player = Player.new(player_params)
  		@player.save

  		redirect_to :action => :index
	end

	def show
		@player = Player.find(params[:id])
	end


	private

	def player_params
  		params.require(:player).permit(:name, :rank)
	end
end
