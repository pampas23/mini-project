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
		@players = Player.page(params[:page]).per(5)
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
  			render :action => :index
  		end
	end

	def show
		#@player = Player.find(params[:id])
	end

	def edit
		#@player = Player.find(params[:id])
		@page = params[:page].to_i 
	end

	def update
		#@player = Player.find(params[:id])
  		@players = Player.page(params[:page]).per(5)
  		if @player.update(player_params)
  			flash[:notice] = "player was successfully updated"
  			@page = params[:page].to_i
  			redirect_to players_path(:page => @page)
  		else
  			flash[:alert] = "player updated failed"
  			render :action => :index
  		end

	end

	def destroy
		#@player = Player.find(params[:id])
  		@player.destroy
  		@page = params[:page].to_i 
  		redirect_to players_path(:page => @page)
	end

	private

	def player_params
  		params.require(:player).permit(:name, :rank,:age,:birth_date)
	end
end
