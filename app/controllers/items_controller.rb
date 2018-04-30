class ItemsController < ApplicationController
	before_action :set_item, only: [:show, :edit, :update, :destroy]
	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end

	def new
		@item = Item.new()
	end

	def create
		@item = Item.new(item_params)
    	respond_to do |format|
	  		if @item.save()
	      		format.html { redirect_to @item,
	                      		notice: 'Item was successfully created.' }
	      		format.json { render action: 'show',
	                      		status: :created, location: @item }
	  		else
	      		format.html { render action: 'new' }
	      		format.json { render json: @item.errors,
	            	          status: :unprocessable_entity }
	  		end
    	end
  	end

  	def update
  		respond_to do |format|
	  		if @item.update(item_params)
	      		format.html { redirect_to @item,
	                      		notice: 'Item was successfully updated.' }
	      		format.json { render action: 'show',
	        		            status: :ok, location: @item }
	  		else
	      		format.html { render action: 'edit' }
	      		format.json { render json: @item.errors,
	                      		status: :unprocessable_entity }
		  	end
    	end
  	end

  	def destroy
  		@item.destroy()
  		respond_to do |format|
  	  		format.html { redirect_to items_url }
	  	  	format.json { head :no_content }
    	end
  	end

	private
		def set_item
			@item = Item.find(params[:id])
		end

		def item_params
			params.require(:item).permit(:name, :price, :quantity, :description)
  		end
end
