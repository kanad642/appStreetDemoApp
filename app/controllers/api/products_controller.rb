class Api::ProductsController < ApplicationController
	def index
		if params[:search].present?
		  json_response(Product.where("name ILIKE :name", name: "%"+params[:search]+"%"))
		else
		  json_response(Product.all)
		end
	end

	def show
		@variant = Variant.where(id: params[:id]).last
		json_response(VariantSerializer.new(@variant))

	end
end
