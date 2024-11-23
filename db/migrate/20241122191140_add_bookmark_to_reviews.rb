class AddBookmarkToReviews < ActiveRecord::Migration[8.0]
  def change
    add_reference :reviews, :bookmark, null: false, foreign_key: true
  end
end
