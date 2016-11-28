class Recipe < ApplicationRecord
  belongs_to :user
  # has_many :pictures
  has_many :favorites
  has_many :comments

  mount_uploaders :pictures, PictureUploader
end
