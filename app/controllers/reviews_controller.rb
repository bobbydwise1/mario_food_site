class ReviewsController < ApplicationController
  def new
    @proudct = Product.find(params[:proudct_id])
    @review = @proudct.reviews.new
  end

  def create
    @proudct = Product.find(params[:proudct_id])
    @review = @proudct.reviews.new(review_params)
    if @review.save
      redirect_to proudct_path(@review.proudct)
    else
      render :new
    end
  end

  def edit
    @proudct = Product.find(params[:proudct_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @proudct = Product.find(params[:proudct_id])
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to proudct_path(@review.proudct)
    else
      render :edit
    end
  end

  def destroy
    @proudct = Product.find(params[:proudct_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to proudct_path(@review.proudct)
  end
private
  def review_params
    params.require(:review).permit(:description, :done)

  end
end
