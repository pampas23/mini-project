class PlayersController < ApplicationController
	before_action :set_player, :only =>[:show, :edit ,:update,:destroy]
	#每次進到controller先跑一次 

	def set_player
		@player = Player.find(params[:id])
	end

	def index
		@players = Player.page(params[:page]).per(5)
		
		if params[:id]
		@player = Player.find(params[:id])
		@sub = "Update"
		else
		@player = Player.new
		@sub = "new"
		end
	end

	def new
		@player = Player.new
	end

	def create

		if params[:id] != nil
		@player = Player.find(params[:id])
		@player.update(player_params)
		@player.save
		else
		@player = Player.new(player_params)
		end

		
  		if @player.save
  		flash[:notice] = "player was successfully created"
  		redirect_to :action => :index
  		else
  		flash[:alert] = "player created failed"
  		render "new"
  		end
	end

	def show
		#@player = Player.find(params[:id])
	end

	def edit
		#@player = Player.find(params[:id])
	end

	def update
		#@player = Player.find(params[:id])
  		
  		if @player.update(player_params)
  		flash[:notice] = "player was successfully updated"
  		redirect_to :action => :index
  		else
  		flash[:alert] = "player updated failed"
  		render "edit"
  		end

	end

	def destroy
		#@player = Player.find(params[:id])
  		@player.destroy

  		redirect_to players_path
	end

	private

	def player_params
  		params.require(:player).permit(:name, :rank)
	end
end
