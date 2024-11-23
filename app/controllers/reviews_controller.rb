class ReviewsController < ApplicationController
  before_action :set_list_and_bookmark, only: [:new, :create, :destroy]
  before_action :set_review, only: [:destroy]

  def new
    @review = @bookmark.reviews.build
  end

  def create
    @review = @bookmark.reviews.build(review_params)
    if @review.save
      redirect_to list_bookmark_path(@list, @bookmark), notice: 'Review successfully created.'
    else
      render :new
    end
  end

  def destroy
    @review.destroy
    redirect_to list_bookmark_path(@list, @bookmark), notice: 'Review successfully deleted.'
  end

  private

  def set_list_and_bookmark
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.find(params[:bookmark_id])
  end

  def set_review
    @review = @bookmark.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:comment)
  end
end
