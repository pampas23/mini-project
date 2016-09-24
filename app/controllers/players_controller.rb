class PlayersController < ApplicationController

	def index
		@players=Player.all
	end

	def new
		@player = Player.new
	end

	def create
		@player = Player.new(player_params)
  		if @player.save
  		flash[:notice] = "player was successfully created"
  		redirect_to :action => :index
  		else
  		flash[:alert] = "player created failed"
  		render "new"
  		end
	end

	def show
		@player = Player.find(params[:id])
	end

	def edit
		@player = Player.find(params[:id])
	end

	def update
		@player = Player.find(params[:id])
  		
  		if @player.update(player_params)
  		flash[:notice] = "player was successfully updated"
  		redirect_to :action => :index
  		else
  		flash[:alert] = "player updated failed"
  		render "edit"
  		end

	end

	def destroy
		@player = Player.find(params[:id])
  		@player.destroy

  		redirect_to players_path
	end

	private

	def player_params
  		params.require(:player).permit(:name, :rank)
	end
end
