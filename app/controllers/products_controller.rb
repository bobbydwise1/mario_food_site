class ProductsController < ApplicationController
  def new
    @list = List.new
    render :new
  end
end
