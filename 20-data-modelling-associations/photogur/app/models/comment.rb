class Comment < ApplicationRecord
  belongs_to :picture # there is a picture_id col in the comments table
  # @comment.picture
  # @comment.create_picture
  # @comment.picture =
end
