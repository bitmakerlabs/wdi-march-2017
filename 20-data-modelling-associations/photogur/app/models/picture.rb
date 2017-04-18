class Picture < ActiveRecord::Base
  has_many :comments # there is a picture_id column in the comments table
  # @picture.comments
  # @picture.comments  <<
  # @picture.comments.count
  # @picture.comments.where(...)
  # @picture.comments.create(...)
  # etc
end
